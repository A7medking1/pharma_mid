import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/add_to_favorite.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/del_from_favorite.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/get_favorites.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(
    this.getFavoritesUseCase,
    this.deleteFromFavoritesUseCase,
    this.addToFavoritesUseCase,
  ) : super(const FavoriteState()) {
    on<GetFavoriteEvent>(_getFavorite);
    on<AddFavoriteEvent>(_addFavorite);
    on<DeleteFavoriteEvent>(_delFavorite);
  }

  Map<int, bool> favorites = {};

  final GetFavoritesUseCase getFavoritesUseCase;
  final DeleteFromFavoritesUseCase deleteFromFavoritesUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;

  FutureOr<void> _getFavorite(
      GetFavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (event.isLoading) {
      emit(state.copyWith(getReqState: ReqState.loading));
    }

    final res = await getFavoritesUseCase(const NoParameters());

    res.fold(
      (l) => emit(
        state.copyWith(
          getReqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        favorites.clear();
        for (var element in r) {
          favorites.addAll({element.id!: true});
        }
        emit(
          state.copyWith(
            getReqState: ReqState.success,
            items: r,
          ),
        );
      },
    );
  }

  FutureOr<void> _addFavorite(
      AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (favorites.containsKey(event.itemId)) {
      favorites[event.itemId] = !favorites[event.itemId]!;
    } else {
      favorites.addAll({event.itemId: true});
    }
    emit(state.copyWith(id: Random.secure().nextInt(100)));

    // emit(state.copyWith(addReqState: ReqState.loading));

    final res = await addToFavoritesUseCase(event.itemId.toString());

    res.fold(
      (l) => emit(
        state.copyWith(
          addReqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addReqState: ReqState.success,
            message: r,
          ),
        );
        add(const GetFavoriteEvent(false));
      },
    );
  }

  FutureOr<void> _delFavorite(
      DeleteFavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (favorites.containsKey(event.itemId)) {
      favorites.remove(event.itemId);
      emit(state.copyWith(id: Random.secure().nextInt(100)));
    }

    emit(state.copyWith(delReqState: ReqState.loading));

    final res = await deleteFromFavoritesUseCase(event.itemId.toString());

    res.fold(
      (l) => emit(
        state.copyWith(
          delReqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            delReqState: ReqState.success,
            message: r,
          ),
        );
         add(const GetFavoriteEvent(false));
      },
    );
  }
}
