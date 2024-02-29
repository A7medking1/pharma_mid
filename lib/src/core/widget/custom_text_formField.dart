import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;

  final bool obscureText;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final TextInputType? textInputType;
  final bool readOnly;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.title,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.grey, fontSize: 13.sp),
              )
            : const SizedBox.shrink(),
        title != ''
            ? SizedBox(
                height: 10.h,
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          onTapOutside: (s) => FocusManager.instance.primaryFocus?.unfocus(),
          keyboardType: textInputType,
          // style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
          style: Theme.of(context).textTheme.titleSmall,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
              borderSide: const BorderSide(
                color: AppColors.white,
              ),
            ),
            hintText: hintText,
            filled: true,
            prefixIconConstraints:
                const BoxConstraints(minHeight: 30, minWidth: 40),
            fillColor: AppColors.backGroundColor,
            hintStyle: TextStyle(color: AppColors.grey, fontSize: 14.sp),
            errorStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.red, fontSize: 14.sp),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
