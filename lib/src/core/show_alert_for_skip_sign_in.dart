import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/widget/alert_dialog.dart';

Future showAlertForSkipSignIn(BuildContext context)async{
  await showAlertDialog(
      context: context,
      onTapYes: () {
        context.pop();
        context.goNamed(Routes.login);
      },
      title: AppStrings.pleaseLogInFirst.tr(),
      icon: AppSvg.signIn,
      buttonText: AppStrings.signIn.tr()
  );
}