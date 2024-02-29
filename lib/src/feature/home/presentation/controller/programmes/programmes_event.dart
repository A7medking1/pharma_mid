part of 'programmes_bloc.dart';

abstract class ProgrammesEvent extends Equatable {
  const ProgrammesEvent();
}

class GetProgrammesEvent extends ProgrammesEvent {

  final bool isLoading ;


  const GetProgrammesEvent({required this.isLoading});

  @override
  List<Object> get props => [];
}
