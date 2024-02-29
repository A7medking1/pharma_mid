import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/font_manager.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(13)),
        backgroundColor: AppColors.primary,
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 10.sp,
              color: AppColors.white,
              fontWeight: FontWeightManager.semiBold),
        ),
      ),
    );
  }
}
