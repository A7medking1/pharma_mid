import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;

  final double? height;

  final double? width;

  final Color? backgroundColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white2,
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.black,
          size: 30.sp,
        ),
      ),
    );
  }
}
