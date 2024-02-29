import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _preferences = sl<AppPreferences>();

  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), () => _goNext());
  }

  // _goNext() {
  //   context.goNamed(Routes.login);
  // }

  _goNext() async {
    final isUserLoggedIn = _preferences.isUserLoggedIn();
    final isUserSkipLogin = _preferences.isSkipLogin();

    if (isUserSkipLogin || isUserLoggedIn) {
      context.goNamed(Routes.home);
    } else {
      context.goNamed(Routes.login);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Image.asset(
                      AppImages.logo,
                    ),
                  ),
                  Text(
                    'SAUDI 2023',
                    style: getBoldStyle(color: Colors.white),
                  ),
                  Text(
                    'OPHTHALMOLOGY',
                    style: getBoldStyle(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                AppImages.bottomLogo,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
