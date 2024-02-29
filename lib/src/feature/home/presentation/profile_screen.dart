import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/custom_button.dart';
import 'package:king_saud_hospital/src/core/widget/custom_loading.dart';
import 'package:king_saud_hospital/src/core/widget/list_tile_widget.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/profile/profile_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.profile.tr(),
      ),
      body: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUserSkipLogin = sl<AppPreferences>().isSkipLogin();

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !isUserSkipLogin
            ? const ProfileList()
            : Center(
                child: CustomButton(
                  text: AppStrings.signIn.tr(),
                  onTap: () {
                    sl<AppPreferences>().removeUserToken();
                    context.goNamed(Routes.login);
                  },
                ),
              ),
      ),
    );
  }
}

class ProfileList extends StatefulWidget {
  const ProfileList({
    super.key,
  });

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  // String? imagePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // imagePath = sl<AppPreferences>().getImagePath();
    context.read<ProfileBloc>().add(GetImageFromPrefEvent());
    context.read<ProfileBloc>().add(GetEmailPrefEvent());
  }

  @override
  Widget build(BuildContext context) {
    final user = sl<AppPreferences>().getUser();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ClipOval(
              child: SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: state.image != ''
                      ? Image.file(
                          File(
                            state.image,
                          ),
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                        )),
            ),
            18.verticalSpace,
            Text(
              state.email != '' ? state.email : user.email,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: const Color(0xFF4E4E4E)),
            ),
            32.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTileWidget(
                    title: AppStrings.editProfile.tr(),
                    onTap: () => context.pushNamed(Routes.editProfile),
                  ),
                  CustomListTileWidget(
                    title: AppStrings.favorite.tr(),
                    onTap: () => context.pushNamed(Routes.favScreen),
                  ),
                  CustomListTileWidget(
                    title: AppStrings.sponsors.tr(),
                    onTap: () => context.pushNamed(Routes.sponsorsScreen),
                  ),
                  CustomListTileWidget(
                    title: AppStrings.language.tr(),
                    onTap: () => context.pushNamed(Routes.langScreen),
                  ),
                  const PauseAccountWidget(),
                ],
              ),
            ),
            18.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                  onTap: () {
                    sl<AppPreferences>().removeUserToken();
                    context.goNamed(Routes.login);
                  },

                  child: Row(
                    children: [
                      SvgPicture.asset(AppSvg.logout),
                      10.horizontalSpace,
                      Text(
                        AppStrings.signOut.tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.red,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class PauseAccountWidget extends StatelessWidget {
  const PauseAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.reqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.reqState == ReqState.success) {
          OverlayLoadingProgress.stop();
        }
        if (state.reqState == ReqState.error) {
          OverlayLoadingProgress.stop();
        }
      },
      builder: (context, state) {
        return CustomListTileWidget(
          trailingWidget: const SizedBox.shrink(),
          fontColor: AppColors.red,
          onTap: () {
            context.read<ProfileBloc>().add(
                  PauseAccountEvent(context: context),
                );
          },
          title: AppStrings.deleteAccount.tr(),
        );
      },
    );
  }
}
