import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/use_case/base_use_case.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/qr_code_model.dart';
import 'package:king_saud_hospital/src/feature/home/domain/use_cases/pauseAccount.dart';

part 'profile_event.dart';

part 'profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.pauseAccountUseCase) : super(const ProfileState()) {
    on<PauseAccountEvent>(_pauseAccount);
    on<GetProfileImageFromGalleryEvent>(_getImageFromGallery);
    on<GetImageFromPrefEvent>(_getImageFromPrefs);
    on<GetEmailPrefEvent>(_getEmail);
  }

  final PauseAccountUseCase pauseAccountUseCase;
  XFile? image;

  FutureOr<void> _pauseAccount(
      PauseAccountEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(reqState: ReqState.loading));

    final res = await pauseAccountUseCase(const NoParameters());

    res.fold(
      (l) {
        emit(
          state.copyWith(
            reqState: ReqState.error,
            message: l.message,
          ),
        );
        event.context.goNamed(Routes.login);
      },
      (r) {
        emit(
          state.copyWith(
            message: r,
            reqState: ReqState.success,
          ),
        );
        sl<AppPreferences>().removeUserToken();
        event.context.goNamed(Routes.login);
      },
    );
  }

  FutureOr<void> _getImageFromGallery(
      GetProfileImageFromGalleryEvent event, Emitter<ProfileState> emit) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      image = XFile(pickedFile.path);
     // print(image!.path);
     // ss = image!.path;
      sl<AppPreferences>().saveImagePath(image!.path);
      add(GetImageFromPrefEvent());

      emit(state.copyWith(
        message: pickedFile.path,
      ));
    } else {
      //print('No image selected.');
    }
  }

  FutureOr<void> _getImageFromPrefs(
      GetImageFromPrefEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(image: sl<AppPreferences>().getImagePath()));
  }

  FutureOr<void> _getEmail(
      GetEmailPrefEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(email: sl<AppPreferences>().getUserEmail()));
  }
}
