import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorDotsWidget extends StatelessWidget {
  final int index;
  final bool isActive;

  const IndicatorDotsWidget({
    super.key,
    required this.index,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 8.h,
        width: dotWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: dotColor,
        ),
      ),
    );
  }

  double? get dotWidth => isActive ? 30.w : 10.w;

  Color? get dotColor => isActive ? AppColors.primary : AppColors.grey;
}
