import 'package:flutter/material.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color? color;
  final Color? fontColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = AppColors.primary,
    this.width,
    this.fontColor = AppColors.white,
    this.textStyle,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: MaterialButton(
        onPressed: onTap,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: fontColor,
                fontWeight: FontWeight.bold
                  ),
        ),
      ),
    );
  }
}
