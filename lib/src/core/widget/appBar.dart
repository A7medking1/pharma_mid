import 'package:flutter/material.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  Widget? leading ,
  Widget? actionButton = const SizedBox.shrink(),
}) {
  return AppBar(
    leading: leading,
    actions: [actionButton!],
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontFamily: CustomFontFamily.medium),
    ),
  );
}