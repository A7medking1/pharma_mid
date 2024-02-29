import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/get_home_programmes_useCase.dart';

part 'programmes_event.dart';

part 'programmes_state.dart';

class ProgrammesBloc extends Bloc<ProgrammesEvent, ProgrammesState> {
  ProgrammesBloc(this.getHomeProgrammesUseCase)
      : super(const ProgrammesState()) {
    on<GetProgrammesEvent>(_getProgrammes);
  }

  final GetHomeProgrammesUseCase getHomeProgrammesUseCase;

  FutureOr<void> _getProgrammes(
      GetProgrammesEvent event, Emitter<ProgrammesState> emit) async {
    if (event.isLoading) {
      emit(state.copyWith(reqState: ReqState.loading));
    }

    final res = await getHomeProgrammesUseCase(const NoParameters());

    res.fold(
      (l) => emit(
        state.copyWith(
          reqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            reqState: ReqState.success,
            programme: r,
          ),
        );
      },
    );
  }
}
