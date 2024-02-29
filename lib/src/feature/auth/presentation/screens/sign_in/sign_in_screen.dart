import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/controller/auth_bloc.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/sign_in_button.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/sign_in_info.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/skip_button.dart';

const String _url = 'https://so2023.sos.org.sa/registration/';

final signInFormKey = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SkipButton(),
                      const SignInInfo(),
                      100.verticalSpace,
                      const FormFieldWidget(),
                      30.verticalSpace,
                      const SignInButton(),
                      24.verticalSpace,
                      const CreateAccountButton(),
                      40.verticalSpace,
                      const TermsAndConditions()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.noAccount.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 11.sp,
              ),
        ),
        5.horizontalSpace,
        InkWell(
          onTap: () => _url.goToUrl(),
          child: Text(
            'Join Now',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primary,
                  fontSize: 11.sp,
                ),
          ),
        ),
      ],
    );
  }

/*  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }*/
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.byLoggingInYouAgreeToThis.tr(),
            style: TextStyle(fontSize: 13.sp),
          ),
          3.verticalSpace,
          Text(
            AppStrings.termsConditions.tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
/*   showAlertDialog(
              context: context,
              actions: false,
              onTapYes: ()=> context.pop(),
              title: AppStrings.The_account_is_created_by_the_admin.tr(),
              icon: AppSvg.signIn,
            );*/
