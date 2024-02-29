part of 'speakers_bloc.dart';

abstract class SpeakersEvent extends Equatable {
  const SpeakersEvent();
}


class GetSpeakersEvent extends SpeakersEvent {
  @override
  List<Object> get props => [];
}
