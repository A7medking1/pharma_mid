part of 'programmes_bloc.dart';

class ProgrammesState extends Equatable {
  final String message;
  final ReqState reqState;

  final List<HomeSessionsModel> programme;

  const ProgrammesState({
    this.message = '',
    this.reqState = ReqState.loading,
    this.programme = const [],
  });

  ProgrammesState copyWith({
    String? message,
    ReqState? reqState,
    List<HomeSessionsModel>? programme,
  }) {
    return ProgrammesState(
      programme: programme ?? this.programme,
      message: message ?? this.message,
      reqState: reqState ?? this.reqState,
    );
  }

  @override
  List<Object?> get props => [
        message,
        reqState,
        programme,
      ];
}
