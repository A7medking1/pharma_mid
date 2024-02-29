import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/vertical_shimmer.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/doctor_sub_cat_screen.dart';

class CategoryDoctorScreen extends StatelessWidget {
  const CategoryDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SpeakersBloc>();

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.theDoctors.tr(),
      ),
      body: BlocBuilder<SpeakersBloc, SpeakersState>(
        builder: (context, state) {
          return switch (state.reqState) {
            ReqState.error => Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ReqState.loading => const HomeShimmer(),
            ReqState.empty => const Text('empty'),
            ReqState.success => FadeAnimation(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (_, index) => 7.verticalSpace,
                          itemCount: state.speakers.length,
                          itemBuilder: (_, index) {
                            if (state.speakers[index].subcategories.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return InkWell(
                              onTap: () {
                                bloc.catIndex = index;
                                context.pushNamed(
                                  Routes.doctorSubCatScreenBody,
                                  extra: DoctorSubCatParameters(
                                      model: state.speakers[index],
                                      name: state.speakers[index].name),
                                );
                              },
                              child: SpeakersCatWidgetItems(
                                icon: AppSvg.agenda1,
                                name: state.speakers[index].name,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}

/*
class CategoryDoctorScreenBuilder extends StatelessWidget {
  const CategoryDoctorScreenBuilder({
    super.key,
    required this.state,
  });

  final SpeakersState state;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.speakers.length,
                itemBuilder: (_, index) {
                  if (state.speakers[index].subcategories.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return InkWell(
                    onTap: () {
                      context.pushNamed(
                        Routes.doctorSubCatScreenBody,
                        extra: DoctorSubCatParameters(
                            model: state.speakers[index],
                            name: state.speakers[index].name),
                      );
                    },
                    child: SpeakersCatWidgetItems(
                      icon: AppSvg.agenda1,
                      name: state.speakers[index].name,
                    ),
                  );
                },
              ),
            ),

            */
/*      InkWell(
              onTap: () {

                context.pushNamed(
                  Routes.doctorSubCatScreenBody,
                  extra: DoctorSubCatParameters(
                      model: state.speakers[5], name: state.speakers[5].name),
                );
              },
              child: SpeakersCatWidgetItems(
                icon: AppSvg.agenda1,
                name: state.speakers[5].name,
              ),
            ),
            20.verticalSpace,
            InkWell(
              onTap: () {

                context.pushNamed(
                  Routes.doctorSubCatScreenBody,
                  extra: DoctorSubCatParameters(
                      model: state.speakers[0], name: state.speakers[0].name),
                );
              },
              child: SpeakersCatWidgetItems(
                icon: AppSvg.agenda1,
                name: state.speakers[0].name,
              ),
            )*/ /*

          ],
        ),
      ),
    );
  }
}
*/

/*
class CategoryDoctorScreenBuilder extends StatelessWidget {
  const CategoryDoctorScreenBuilder({
    super.key,
    required this.state,
  });

  final SpeakersState state;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context, outerIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.speakers[outerIndex].subcategories.isNotEmpty) ...[
                  Text(
                    state.speakers[outerIndex].slug,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontFamily: CustomFontFamily.medium),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 120.h,
                    child: ListViewHorizontal(
                      itemBuilder: (_, index) {
                        if (state.speakers[outerIndex].subcategories[index]
                            .speakers.isNotEmpty) {
                          return InkWell(
                            onTap: () {
                              /// TODO go To Doctor Screen
                              print(state.speakers[outerIndex]
                                  .subcategories[index].slug);

                              context.pushNamed(
                                Routes.doctors,
                                extra: DoctorScreenParams(
                                  catName: state.speakers[outerIndex]
                                      .subcategories[index].slug,
                                  speakers: state.speakers[outerIndex]
                                      .subcategories[index].speakers,
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsetsDirectional.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(25),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.speakers[outerIndex]
                                        .subcategories[index].name,
                                    style:
                                        Theme.of(context).textTheme.titleSmall!.copyWith(
                                          fontSize: 15.sp
                                        ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        ...state.speakers[outerIndex]
                                            .subcategories[index].speakers
                                            .map(
                                          (e) => Align(
                                            widthFactor: 0.6,
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                e.image == ''
                                                    ? image
                                                    : e.image,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      count: state.speakers[outerIndex].subcategories.length,
                    ),
                  )
                ]
              ],
            );
          },
          separatorBuilder: (context, index) => 3.verticalSpace,
          itemCount: state.speakers.length,
        ),
      ),
    );
  }
}
*/

class SpeakersCatWidgetItems extends StatelessWidget {
  const SpeakersCatWidgetItems({
    super.key,
    required this.icon,
    required this.name,
  });

  final String icon;

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadiusDirectional.circular(25.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsetsDirectional.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        // AppSvg.agenda1,
                        icon,
                        height: 40,
                      ),
                      13.verticalSpace,
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 22, fontFamily: CustomFontFamily.medium),
                      ),
                      7.verticalSpace,
                      SizedBox(
                        width: 200,
                        child: Text(
                          AppStrings.conferencesDesc.tr(),
                          style: TextStyle(
                              color: AppColors.grey.withOpacity(0.7),
                              fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
