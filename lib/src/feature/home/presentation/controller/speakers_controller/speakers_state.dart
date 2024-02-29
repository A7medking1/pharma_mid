part of 'speakers_bloc.dart';

class SpeakersState extends Equatable {
  final String message;
  final ReqState reqState;

  final List<SpeakersModel> speakers;

  final List<Speakers> paginatedSpeakers;

  const SpeakersState({
    this.message = '',
    this.reqState = ReqState.loading,
    this.speakers = const [],
    this.paginatedSpeakers = const [],
  });

  SpeakersState copyWith({
    String? message,
    ReqState? reqState,
    List<SpeakersModel>? speakers,
    List<Speakers>? paginatedSpeakers,
  }) {
    return SpeakersState(
      speakers: speakers ?? this.speakers,
      message: message ?? this.message,
      reqState: reqState ?? this.reqState,
      paginatedSpeakers: paginatedSpeakers ?? this.paginatedSpeakers,
    );
  }

  @override
  List<Object?> get props => [message, reqState, speakers, paginatedSpeakers];
}
