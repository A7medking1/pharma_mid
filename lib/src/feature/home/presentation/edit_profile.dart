import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/custom_button.dart';
import 'package:king_saud_hospital/src/core/widget/custom_text_button.dart';
import 'package:king_saud_hospital/src/core/widget/custom_text_formField.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/profile/profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  imagePath = sl<AppPreferences>().getImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.editProfile.tr(),
      ),
      body: const EditProfileBody(),
    );
  }
}

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = sl<AppPreferences>().getUser();
    final ProfileBloc bloc = context.read<ProfileBloc>();
    return SingleChildScrollView(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SizedBox(
            //width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: bloc.image == null
                          ? Image.file(
                              File(
                                state.image,
                              ),
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(
                                bloc.image!.path,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  CustomTextButton(
                    text: AppStrings.changeYourProfilePicture.tr(),
                    onPressed: () {
                      bloc.add(GetProfileImageFromGalleryEvent());
                    },
                    fontSize: 12.sp,
                  ),
                  40.verticalSpace,
                  CustomTextFormField(
                    title: AppStrings.usernameOrEmailAddress.tr(),
                    controller: controller,
                    hintText: state.email != '' ? state.email : user.email,
                  ),
                  100.verticalSpace,
                  CustomButton(
                    onTap: () {
                      sl<AppPreferences>().saveUserEmail(controller.text);
                      context.read<ProfileBloc>().add(GetEmailPrefEvent());
                      context.read<ProfileBloc>().add(GetImageFromPrefEvent());

                      context.goNamed(Routes.home);
                    },
                    text: AppStrings.submit.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
