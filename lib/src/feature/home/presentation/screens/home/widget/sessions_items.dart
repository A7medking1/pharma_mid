import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/notification_service/notification_service.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/show_alert_for_skip_sign_in.dart';
import 'package:king_saud_hospital/src/core/widget/small_button.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_items.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/notification_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/favorite/favorite_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/notification/notification_cubit.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';

class SessionsItems extends StatefulWidget {
  const SessionsItems({
    super.key,
    required this.session,
    this.isFavScreen = false,
    this.onTap,
  });

  final HomePrograms session;
  final bool? isFavScreen;
  final void Function()? onTap;

  @override
  State<SessionsItems> createState() => _SessionsItemsState();
}

class _SessionsItemsState extends State<SessionsItems> {
  @override
  Widget build(BuildContext context) {
    final items = NotificationItems(
      sessionId: widget.session.id!,
      title: widget.session.title!,
      image: widget.session.image!,
      content: widget.session.content!,
      customField: NotificationSessionCustomField(
        pageCaption: widget.session.customField!.pageCaption!,
        sessionType: widget.session.customField!.sessionType!,
        sessionSpeaker: widget.session.customField!.sessionSpeaker!,
        sessionDate: widget.session.customField!.sessionDate!,
        sessionTime: widget.session.customField!.sessionTime!,
        location: widget.session.customField!.location!,
        documentLink: '',
      ),
      customFieldVideo: widget.session.customFieldVideo ?? '',
      favoriteStatus: widget.session.favoriteStatus!,
    );

    final bloc = context.read<FavoriteBloc>();
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return BlocBuilder<ProgrammesBloc, ProgrammesState>(
            builder: (_, s) {
              return FadeAnimation(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: InkWell(
                    onTap: widget.onTap ??
                        () {
                          final bool isUserSkipLogin =
                              sl<AppPreferences>().isSkipLogin();

                          if (isUserSkipLogin) {
                            showAlertForSkipSignIn(context);
                          } else {
                            context.pushNamed(Routes.programsDetails,
                                extra: widget.session);
                          }
                        },
                    child: FittedBox(
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(20.r)),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsetsDirectional.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.backGroundColor,
                              borderRadius:
                                  BorderRadiusDirectional.circular(20.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.theFirstTrack.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 10.sp,
                                              ),
                                        ),
                                        5.verticalSpace,
                                        Text(
                                          widget.session.title!,
                                          //  overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  fontFamily:
                                                      CustomFontFamily.medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final bool isUserSkipLogin =
                                          sl<AppPreferences>().isSkipLogin();

                                      if (isUserSkipLogin) {
                                        showAlertForSkipSignIn(context);
                                      } else {
                                        final bool isFav =
                                            bloc.favorites[widget.session.id] ??
                                                false;

                                        //print(widget.session.favoriteStatus);
                                        // setState(() {});
                                        if (widget.isFavScreen! || isFav) {
                                          context.read<FavoriteBloc>().add(
                                                DeleteFavoriteEvent(
                                                    widget.session.id!,
                                                    context: context),
                                              );
                                        } else {
                                          context.read<FavoriteBloc>().add(
                                                AddFavoriteEvent(
                                                    widget.session.id!,
                                                    context: context),
                                              );
                                        }
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 17.r,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset(
                                        bloc.favorites[widget.session.id] ??
                                                false
                                            ? AppSvg.heartfilled
                                            : AppSvg.heart,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${AppStrings.place.tr()} :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 12.sp,
                                        ),
                                  ),
                                  5.verticalSpace,
                                  Text(
                                    widget.session.customField!.location!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 15.sp,
                                            fontFamily:
                                                CustomFontFamily.medium),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            AppSvg.calender,
                                            height: 17.h,
                                          ),
                                          5.horizontalSpace,
                                          Text(
                                            widget.session.customField!
                                                .sessionDate!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                ),
                                          )
                                        ],
                                      ),
                                      8.horizontalSpace,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            AppSvg.time_circle,
                                            height: 17.h,
                                          ),
                                          5.horizontalSpace,
                                          Text(
                                            widget.session.customField!
                                                .sessionTime!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  CustomSmallButton(
                                    onPressed: () {
                                      final bool isUserSkipLogin =
                                          sl<AppPreferences>().isSkipLogin();

                                      if (isUserSkipLogin) {
                                        /// skip login
                                        showAlertForSkipSignIn(context);
                                      } else {
                                        /// login
                                        handleNotificationAfter1Min();
                                        handleNotificationAfter30Min();

                                        /// add to storage

                                        NotificationCubit.get(context)
                                            .addNotification(items);
                                      }
                                    },
                                    text: AppStrings.activateNotifications.tr(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void handleNotificationAfter1Min() {
    int id = widget.session.id! + 1;
    NotificationHandler.scheduledNotification(
      id: id,
      session: widget.session,
      remind: 1,
      payload: jsonEncode(widget.session.toJson()),
    ).then((value) {
      /*  showToast(
        msg: 'scheduled success',
        state: ToastStates.SUCCESS,
      );*/
    }).catchError((e) {
      showToast(
        msg: 'Time Not Correct',
        state: ToastStates.ERROR,
      );
    });
  }

  void handleNotificationAfter30Min() {
    int id = widget.session.id! + 2;

    NotificationHandler.scheduledNotification(
      id: id,
      session: widget.session,
      remind: 30,
      payload: jsonEncode(widget.session.toJson()),
    ).then((value) {
      showToast(
        msg: 'scheduled success',
        state: ToastStates.SUCCESS,
      );
    }).catchError((e) {
      showToast(
        msg: 'Time Not Correct',
        state: ToastStates.ERROR,
      );
    });
  }
}
