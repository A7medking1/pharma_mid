import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/show_alert_for_skip_sign_in.dart';

class HomeEntryIdCheck extends StatelessWidget {
  const HomeEntryIdCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bool isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

        if (isUserSkipLogin) {
          showAlertForSkipSignIn(context);
        } else {
          context.pushNamed(Routes.scanBarCode);
        }
      },
      child: Container(
        height: 108.h,
        padding: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadiusDirectional.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.entryIDCheck.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: CustomFontFamily.medium,
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: AppColors.primaryWithOp,
                  child: Image.asset(
                    AppImages.qr,
                    fit: BoxFit.cover,
                    color: AppColors.white,
                  ),
                ),
                20.horizontalSpace,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.defaultTextColor,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
