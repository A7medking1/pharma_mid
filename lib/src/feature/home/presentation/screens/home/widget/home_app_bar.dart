import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.welcomeInOphthalmology.tr(),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(height: 1.7, fontFamily: CustomFontFamily.medium),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(end: 40.w),
          child: Image.asset(
            AppImages.logo,
            fit: BoxFit.cover,
            height: 45.h,
            width: 35.w,
            color: AppColors.black,
          ),
        ),
        IconButton(
            onPressed: () {
              context.pushNamed(Routes.notification);
              /* NotificationHandler.scheduledNotification(
                id: 22,
                session: HomePrograms(
                  image: '',
                  id: 5,
                  title: 'hello world ${DateTime.now()}',
                  favoriteStatus: false,
                  content: 'sss',
                  customFieldVideo: '',
                  customField: HomeCustomField(
                      sessionType: '',
                      sessionTime: '201',
                      sessionDate: '',
                      sessionSpeaker: ['a', 'b', 'd', 'c'],
                      documentLink: 'a',
                      pageCaption: 'aa',
                      location: 'AAAA'),
                ),
                remind: 1,
              ).then((value) {
                showToast(msg: 'Success', state: ToastStates.SUCCESS);
              }).catchError((e) {
                showToast(msg: 'Error', state: ToastStates.ERROR);
              });*/
            },
            icon: SvgPicture.asset(AppSvg.bell)),
      ],
    );
  }
}
