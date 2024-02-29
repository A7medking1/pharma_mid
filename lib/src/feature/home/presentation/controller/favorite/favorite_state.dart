part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final String message;
  final ReqState? addReqState;
  final ReqState? delReqState;
  final ReqState getReqState;

  final List<HomePrograms> items;

  final int id;

  const FavoriteState({
    this.message = '',
    this.getReqState = ReqState.loading,
    this.addReqState,
    this.delReqState,
    this.items = const [],
    this.id = 0,
  });

  FavoriteState copyWith({
    String? message,
    ReqState? addReqState,
    ReqState? getReqState,
    ReqState? delReqState,
    List<HomePrograms>? items,
    int? id,
  }) {
    return FavoriteState(
      items: items ?? this.items,
      message: message ?? this.message,
      delReqState: delReqState ?? this.delReqState,
      addReqState: addReqState ?? this.addReqState,
      getReqState: getReqState ?? this.getReqState,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        message,
        addReqState,
        delReqState,
        getReqState,
        items,
    id,
      ];
}
