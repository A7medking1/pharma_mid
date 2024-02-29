import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/entity/login_entity.dart';
import 'package:king_saud_hospital/src/feature/auth/domain/use_cases/login_useCase.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/favorite/favorite_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.loginUseCase,
  ) : super(const AuthState()) {
    on<LoginAuthEvent>(_login);
  }

  final LoginUseCase loginUseCase;

  final TextEditingController email = TextEditingController();

  FutureOr<void> _login(LoginAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginReqState: AuthRequestState.loading));

    final result = await loginUseCase(event.loginEntity);

    result.fold(
      (l) => emit(
        state.copyWith(
          loginReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            token: r,
            loginReqState: AuthRequestState.success,
          ),
        );
        sl<AppPreferences>().setUserToken(state.token!);
        event.context.read<ProgrammesBloc>().add(const GetProgrammesEvent(isLoading: true));
        event.context.read<SpeakersBloc>().add(GetSpeakersEvent());
        event.context.read<FavoriteBloc>().add(const GetFavoriteEvent(true));
        event.context.goNamed(Routes.home);
      },
    );
  }
}
