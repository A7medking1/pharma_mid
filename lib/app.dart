import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/theme/app_dark_theme.dart';
import 'package:king_saud_hospital/src/core/resources/theme/app_light_theme.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/favorite/favorite_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';

import 'src/feature/home/presentation/controller/profile/profile_bloc.dart';
import 'src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) {
      return context.setLocale(local);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(context) {
    print(sl<AppPreferences>().getUserToken());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<SpeakersBloc>()..add(GetSpeakersEvent())),
        BlocProvider(
          create: (context) => sl<ProfileBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ProgrammesBloc>()
            ..add(
              const GetProgrammesEvent(isLoading: true),
            ),
        ),
        BlocProvider(
          create: (context) => sl<FavoriteBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        builder: (context, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: getAppTheme(),
            themeMode: ThemeMode.light,
            darkTheme: getAppDarkTheme(),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
