import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/feature/app_layout.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/edit_profile.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/favorite_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/floor_plane_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/language_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/notifications_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/poster_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/programe_at_glance_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/programe_details.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/programs_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/scan_barcode.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/sessions_category.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/sub_sesions_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/doctor_info.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/doctor_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/doctor_sub_cat_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/search_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/sponsers_screen.dart';
import 'package:king_saud_hospital/src/feature/splash/splash.dart';

import '../../feature/home/presentation/screens/home/sessions_screen.dart';

class Routes {
  Routes._();

  static const splash = '/';
  static const login = 'login';
  static const home = 'home';
  static const doctorInformation = 'doctorInformation';
  static const programs = 'programs';
  static const programsDetails = 'programsDetails';
  static const editProfile = 'editProfile';
  static const favScreen = 'favScreen';
  static const langScreen = 'langScreen';
  static const scanBarCode = 'scanBarCode';
  static const notification = 'notification';
  static const doctors = 'doctors';
  static const search = 'search';
  static const sessionsSubScreen = 'SessionsSubScreen';
  static const sessionsScreen = 'SessionsScreen';
  static const posterScreen = 'posterScreen';
  static const doctorSubCatScreenBody = 'doctorSubCatScreenBody';
  static const glanceScreen = 'glanceScreen';
  static const floorPlaneScreen = 'floorPlaneScreen';
  static const sponsorsScreen = 'sponsorsScreen';
}

class _RouterPath {
  _RouterPath._();

  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const doctorInformation = '/doctorInformation';
  static const programs = '/programs';
  static const programsDetails = '/programsDetails';
  static const editProfile = '/editProfile';
  static const favScreen = '/favScreen';
  static const langScreen = '/langScreen';
  static const scanBarCode = '/scanBarCode';
  static const notification = '/notification';
  static const doctors = '/doctors';
  static const search = '/search';
  static const sessionsSubScreen = '/SessionsSubScreen';
  static const sessionsScreen = '/SessionsScreen';
  static const posterScreen = '/posterScreen';
  static const doctorSubCatScreenBody = '/doctorSubCatScreenBody';
  static const glanceScreen = '/glanceScreen';
  static const floorPlaneScreen = '/floorPlaneScreen';
  static const sponsorsScreen = '/sponsorsScreen';
}

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.splash,
        path: _RouterPath.splash,
        builder: (_, state) => const SplashScreen(),
      ),
      GoRoute(
        name: Routes.login,
        path: _RouterPath.login,
        builder: (_, state) => const SignInScreen(),
      ),
      GoRoute(
        name: Routes.home,
        path: _RouterPath.home,
        builder: (_, state) => const AppLayOut(),
      ),
      GoRoute(
        name: Routes.doctorInformation,
        path: _RouterPath.doctorInformation,
        builder: (_, state) => DoctorInformation(
          speaker: state.extra as Speakers,
        ),
      ),
      // GoRoute(
      //   name: Routes.programs,
      //   path: _RouterPath.programs,
      //   builder: (_, state) => const ProgramsScreen(),
      // ),
      GoRoute(
        name: Routes.programsDetails,
        path: _RouterPath.programsDetails,
        builder: (_, state) => ProgrammeDetailsScreen(
          session: state.extra as HomePrograms,
        ),
      ),
      GoRoute(
        name: Routes.editProfile,
        path: _RouterPath.editProfile,
        builder: (_, state) => const EditProfileScreen(),
      ),
      GoRoute(
        name: Routes.favScreen,
        path: _RouterPath.favScreen,
        builder: (_, state) => const FavoriteScreen(),
      ),
      GoRoute(
        name: Routes.langScreen,
        path: _RouterPath.langScreen,
        builder: (_, state) => const LanguageScreen(),
      ),
      GoRoute(
        name: Routes.scanBarCode,
        path: _RouterPath.scanBarCode,
        builder: (_, state) => const ScanBarcodeScreen(),
      ),
      GoRoute(
        name: Routes.notification,
        path: _RouterPath.notification,
        builder: (_, state) => const NotificationScreen(),
      ),
      GoRoute(
        name: Routes.doctors,
        path: _RouterPath.doctors,
        builder: (_, state) => DoctorsScreen(
          params: state.extra as DoctorScreenParams,
        ),
      ),
      GoRoute(
        name: Routes.search,
        path: _RouterPath.search,
        builder: (_, state) => const SearchScreen(),
      ),
      GoRoute(
        name: Routes.sessionsSubScreen,
        path: _RouterPath.sessionsSubScreen,
        builder: (_, state) => SessionsSubScreen(
          subCategory: state.extra as List<HomeSubcategories>,
        ),
      ),
      GoRoute(
        name: Routes.sessionsScreen,
        path: _RouterPath.sessionsScreen,
        builder: (_, state) => SessionsScreen(
          parameters: state.extra as FuckenSessionScreenParameters,
          //  parameters: state.queryParameters['params'],
        ),
      ),
      GoRoute(
        name: Routes.posterScreen,
        path: _RouterPath.posterScreen,
        builder: (_, state) => const PosterScreen(),
      ),
      GoRoute(
        name: Routes.floorPlaneScreen,
        path: _RouterPath.floorPlaneScreen,
        builder: (_, state) => const FloorPlaneScreen(),
      ),
      GoRoute(
        name: Routes.glanceScreen,
        path: _RouterPath.glanceScreen,
        builder: (_, state) => const ProgrammeAtGlanceScreen(),
      ),
      GoRoute(
        name: Routes.sponsorsScreen,
        path: _RouterPath.sponsorsScreen,
        builder: (_, state) => const SponsorsScreen(),
      ),
      GoRoute(
        name: Routes.doctorSubCatScreenBody,
        path: _RouterPath.doctorSubCatScreenBody,
        builder: (_, state) => DoctorSubCatScreen(
          params: state.extra as DoctorSubCatParameters,
        ),
      ),
    ],
  );
}
