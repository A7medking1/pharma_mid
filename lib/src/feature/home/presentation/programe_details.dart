import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/custom_button.dart';
import 'package:king_saud_hospital/src/core/widget/list_view_horizontal.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';

class ProgrammeDetailsScreen extends StatelessWidget {
  final HomePrograms session;

  const ProgrammeDetailsScreen({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.conferenceDetails.tr(),
      ),
      body: _ProgrammesDetailsBody(
        session: session,
      ),
    );
  }
}

class _ProgrammesDetailsBody extends StatelessWidget {
  const _ProgrammesDetailsBody({Key? key, required this.session})
      : super(key: key);

  final HomePrograms session;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(25),
                  child: Image.asset(
                    AppImages.doctor,
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                  ),
                ),
                16.verticalSpace,
                Text(
                  session.title!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 23.sp,
                      ),
                ),
                18.verticalSpace,
                SpeakersWidget(session: session),
                16.verticalSpace,
                const Divider(
                  thickness: 0.7,
                ),
                18.verticalSpace,
                DateAndTimeWidget(session: session),
                15.verticalSpace,
                Text(
                  '${AppStrings.location.tr()} :',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  session.customField!.location!,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                ),
              ],
            ),
            25.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                onTap: () {
                  context.goNamed(Routes.home);
                },
                text: AppStrings.scanTheCodeToEnter.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeakersWidget extends StatelessWidget {
  const SpeakersWidget({
    super.key,
    required this.session,
  });

  final HomePrograms session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Speakers',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15.sp,
                color: const Color(0xFF5C5C5C),
              ),
        ),
        SizedBox(
          height: 50.h,
          child: ListViewHorizontal(
            count: session.customField!.sessionSpeaker!.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      AppSvg.doc_svg,
                      height: 25,
                    ),
                    5.horizontalSpace,
                    Text(
                      session.customField!.sessionSpeaker![index],
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({
    super.key,
    required this.session,
  });

  final HomePrograms session;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 100.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Date',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
                15.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvg.calender,
                      height: 22.h,
                    ),
                    5.horizontalSpace,
                    Text(
                      session.customField!.sessionDate!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 1.1,
            endIndent: 15,
            indent: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Time',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
                15.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvg.time_circle,
                      height: 22.h,
                    ),
                    5.horizontalSpace,
                    Text(
                      session.customField!.sessionTime!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
