import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_items.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/notification/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getNotifications(),
      child: Scaffold(
          appBar: buildAppBar(
            context: context,
            title: AppStrings.notifications.tr(),
            actionButton: const RemoveAllButton(),
          ),
          body: const NotificationScreenBody()),
    );
  }
}

class RemoveAllButton extends StatelessWidget {
  const RemoveAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: () {
            NotificationCubit.get(context).removeAllNotification();
          },
          child: Text(
            'remove all',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 12.sp, color: Colors.blue),
          )),
    );
  }
}

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = NotificationCubit.get(context);
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is GetNotificationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cubit.notificationItems.isEmpty) {
          return Center(
              child: Text(
            'EMPTY',
            style: Theme.of(context).textTheme.titleMedium,
          ));
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return NotificationsItemsScreen(
              items: cubit.notificationItems[index],
              index: index,
            );
          },
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemCount: cubit.notificationItems.length,
        );
      },
    );
  }
}

class NotificationsItemsScreen extends StatelessWidget {
  const NotificationsItemsScreen({
    super.key,
    required this.items,
    required this.index,
  });

  final NotificationItems items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DateSessionWidget(items: items),
            15.verticalSpace,
            Container(
              width: MediaQuery.sizeOf(context).width,
              //   height: 120,
              padding: const EdgeInsetsDirectional.all(20),
              decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppSvg.notification,
                        height: 30.h,
                      ),
                      IconButton(
                        onPressed: () {
                          NotificationCubit.get(context)
                              .removeNotification(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  7.verticalSpace,
                  Text(
                    items.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontFamily: CustomFontFamily.medium, fontSize: 14),
                  ),
                  9.verticalSpace,
                  Text(
                    items.customField.sessionDate,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 9.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateSessionWidget extends StatelessWidget {
  const DateSessionWidget({
    super.key,
    required this.items,
  });

  final NotificationItems items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              AppSvg.calender,
              height: 17.h,
            ),
            5.horizontalSpace,
            Text(
              items.customField.sessionDate,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 11.sp,
                  ),
            )
          ],
        ),
        8.horizontalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              AppSvg.time_circle,
              height: 17.h,
            ),
            5.horizontalSpace,
            Text(
              items.customField.sessionTime,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 11.sp,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
