import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/font_manager.dart';

import '../resources/style.dart';

class SeeMoreWidget extends StatelessWidget {
  final String title;
  final Widget? page;
  final Color? seeMoreColor;
  final void Function()? onPressed;

  const SeeMoreWidget({
    Key? key,
    required this.title,
    this.page,
    this.onPressed,
    this.seeMoreColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightManager.medium ,
              fontFamily: CustomFontFamily.medium,

              color: const Color(0xFF1D1D1D)
              ),
        ),
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  //  AppStrings.show_more.tr(),
                  AppStrings.viewAll.tr(),
                  style: TextStyle(
                      fontSize: 10.sp, color: seeMoreColor ?? AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
