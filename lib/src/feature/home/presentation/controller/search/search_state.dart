part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String message;
  final ReqState reqState;

  final List<HomePrograms> search;

  const SearchState({
    this.message = '',
    this.reqState = ReqState.empty,
    this.search = const [],
  });

  SearchState copyWith({
    String? message,
    ReqState? reqState,
    List<HomePrograms>? search,
  }) {
    return SearchState(
      search: search ?? this.search,
      message: message ?? this.message,
      reqState: reqState ?? this.reqState,
    );
  }

  @override
  List<Object?> get props => [message, reqState, search];
}
