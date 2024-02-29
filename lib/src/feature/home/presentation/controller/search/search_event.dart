part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchEvent extends SearchEvent {
  final String query;

  const GetSearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}
