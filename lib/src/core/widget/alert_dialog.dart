import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';

Future showAlertDialog({
  required BuildContext context,
  required void Function() onTapYes,
  required String title,
  required String icon,
  bool actions = true ,
  /// String buttonText = AppStrings.yes,
  String buttonText = 'yes',
}) async {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      ///AppStrings.no.tr(),
      'no',
      style: TextStyle(
        color: AppColors.black,
      ),
    ),
    onPressed: () => context.pop(),
  );
  Widget continueButton = Card(
    child: Container(
      color: AppColors.primary,
      child: TextButton(
        onPressed: onTapYes,
        child: Text(
          buttonText,
          style: TextStyle(color: AppColors.white, fontSize: 15.sp),
        ),
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(20.r),
    ),
    title: SvgPicture.asset(
      icon,
      height: 70.h,
    ),
    actionsAlignment: MainAxisAlignment.center,
    content: Text(
      title,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w300,
          ),
    ),
    actions: actions ?  [
     cancelButton,
      continueButton,
    ] : [],
  );

  // show the dialog
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
