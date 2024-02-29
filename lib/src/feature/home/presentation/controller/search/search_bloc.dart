import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/search_programmes.dart';
import 'package:rxdart/transformers.dart';

part 'search_event.dart';

part 'search_state.dart';

const _duration = Duration(milliseconds: 500);

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.getSearchProgrammesUseCase) : super(const SearchState()) {
    on<GetSearchEvent>(
      _getSearch,
      transformer: (event, mapper) {
        return (event).debounceTime(_duration).flatMap(mapper);
      },
    );
  }

  final GetSearchProgrammesUseCase getSearchProgrammesUseCase;

  FutureOr<void> _getSearch(
    GetSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(reqState: ReqState.loading));

    final res = await getSearchProgrammesUseCase(event.query);

    res.fold(
      (l) => emit(
        state.copyWith(
          reqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        r.isEmpty
            ? emit(
                state.copyWith(
                  reqState: ReqState.empty,
                ),
              )
            : emit(
                state.copyWith(
                  reqState: ReqState.success,
                  search: r,
                ),
              );
      },
    );
  }
}
