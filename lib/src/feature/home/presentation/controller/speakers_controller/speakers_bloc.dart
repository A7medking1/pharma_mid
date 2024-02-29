import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/get_speakers_useCase.dart';

part 'speakers_event.dart';

part 'speakers_state.dart';

class SpeakersBloc extends Bloc<SpeakersEvent, SpeakersState> {
  SpeakersBloc(this.getSpeakersUseCase) : super(const SpeakersState()) {
    on<GetSpeakersEvent>(_getSpeakers);
  }

  final GetSpeakersUseCase getSpeakersUseCase;

  int page = 1;

  int catIndex = 0;

  int subCatIndex = 0;

   bool isPaginated = false;

  FutureOr<void> _getSpeakers(
      GetSpeakersEvent event, Emitter<SpeakersState> emit) async {
    emit(state.copyWith(reqState: ReqState.loading));

    final res = await getSpeakersUseCase(page);

    res.fold(
      (l) => emit(
        state.copyWith(
          reqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          reqState: ReqState.success,
          paginatedSpeakers: r[catIndex].subcategories[subCatIndex].speakers,
          speakers: r,
        ),
      ),
    );
  }
}
