import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/notification_service/notification_service.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/profile_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/home.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/cat_doctors_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/sponsers_screen.dart';

import 'home/presentation/controller/favorite/favorite_bloc.dart';

class AppLayOut extends StatefulWidget {
  const AppLayOut({Key? key}) : super(key: key);

  @override
  State<AppLayOut> createState() => _AppLayOutState();
}

class _AppLayOutState extends State<AppLayOut> {
  final List<Widget> screens = [
    const HomeScreen(),
    const SponsorsScreen(),
    const CategoryDoctorScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    listenToNots();

    context.read<FavoriteBloc>().add(const GetFavoriteEvent(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight * 2,
        color: Colors.white12,
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15,
            end: 15,
            bottom: 30,
            top: 20,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadiusDirectional.circular(35)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 30.w, end: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSvgIcon(
                      index: 0,
                      selectedIcon: AppSvg.navFilled1,
                      unSelectedIcon: AppSvg.nav1,
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      }),
                  buildSvgIcon(
                    index: 1,
                    selectedIcon: AppSvg.navFilled2,
                    unSelectedIcon: AppSvg.nav2,
                    onTap: () {
                      setState(
                        () {
                          currentIndex = 1;
                        },
                      );
                    },
                  ),
                  buildSvgIcon(
                      index: 2,
                      selectedIcon: AppSvg.navFilled3,
                      unSelectedIcon: AppSvg.nav3,
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      }),
                  buildSvgIcon(
                      index: 3,
                      selectedIcon: AppSvg.navFilled4,
                      unSelectedIcon: AppSvg.nav4,
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listenToNots() =>
      NotificationHandler.onNotificationClick.stream.listen(onListener);

  void onListener(String? payload) {
    if (kDebugMode) {
      print(payload);
    }

    final json = jsonDecode(payload!) as Map<String, dynamic>;

    HomePrograms post = HomePrograms.fromJson(json);

    context.pushNamed(Routes.programsDetails, extra: post);
  }

  Widget buildSvgIcon({
    required int index,
    required String selectedIcon,
    required String unSelectedIcon,
    required void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          currentIndex == index ? selectedIcon : unSelectedIcon,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
