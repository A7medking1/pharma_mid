import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/favorite/favorite_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: InkWell(
          onTap: () {
            sl<AppPreferences>().setUserToken(skipLogin);
            context.read<ProgrammesBloc>().add(const GetProgrammesEvent(isLoading: true));
            context.read<SpeakersBloc>().add(GetSpeakersEvent());
            context.read<FavoriteBloc>().add(const GetFavoriteEvent(true));
            context.goNamed(Routes.home);
          },
          child: Container(
            padding: const EdgeInsetsDirectional.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFF8EFEF),
                borderRadius: BorderRadiusDirectional.circular(25)),
            child: Text(
              AppStrings.skip.tr(),
              style:
                  TextStyle(fontSize: 12.sp, color: AppColors.defaultTextColor),
            ),
          ),
        ),
      ),
    );
  }
}

