import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';

class SignInInfo extends StatelessWidget {
  const SignInInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
        //  height: 100,
         // width: 100,
          child: Image.asset(
            AppImages.logo,
            color: AppColors.black,
          ),
        ),
        50.verticalSpace,
        Text(
          AppStrings.signIn.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),

      ],
    );
  }
}
