import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/widget/custom_loading.dart';
import 'package:king_saud_hospital/src/core/widget/custom_text_formField.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/controller/auth_bloc.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginReqState == AuthRequestState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.loginReqState == AuthRequestState.success) {
          OverlayLoadingProgress.stop();
        }
        if (state.loginReqState == AuthRequestState.error) {
          OverlayLoadingProgress.stop();
          showToast(msg: state.message, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: bloc.email,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.usernameOrEmailAddress.tr();
                }
                return null;
              },
              title: AppStrings.usernameOrEmailAddress.tr(),
              hintText: AppStrings.usernameOrEmailAddress.tr(),
            ),
          ],
        );
      },
    );
  }
}

void showToast({
  required String msg,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  return switch (state) {
    ToastStates.SUCCESS => Colors.green,
    ToastStates.WARNING => Colors.amber,
    ToastStates.ERROR => Colors.red,
  };
}
