import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/show_alert_for_skip_sign_in.dart';
import 'package:king_saud_hospital/src/core/widget/custom_text_formField.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: '',
      onTap: () {
        final bool isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

        if (isUserSkipLogin) {
          showAlertForSkipSignIn(context);
        } else {
          context.pushNamed(Routes.search);
        }
      },
      readOnly: true,
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        child: SvgPicture.asset(
          AppSvg.search,
        ),
      ),
      hintText: AppStrings.search.tr(),
    );
  }
}
