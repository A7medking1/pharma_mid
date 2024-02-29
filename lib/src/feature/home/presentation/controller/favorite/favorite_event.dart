part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class GetFavoriteEvent extends FavoriteEvent {
  final bool isLoading ;

  const GetFavoriteEvent(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}


class AddFavoriteEvent extends FavoriteEvent {

  final int itemId;
  final BuildContext context;


  const AddFavoriteEvent(this.itemId,{required this.context});

  @override
  List<Object> get props => [itemId];
}


class DeleteFavoriteEvent extends FavoriteEvent {

  final int itemId;
  final BuildContext context;

  const DeleteFavoriteEvent(this.itemId, {required this.context});

  @override
  List<Object> get props => [itemId];
}


