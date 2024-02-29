import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
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
import 'package:king_saud_hospital/src/core/widget/list_view_horizontal.dart';
import 'package:king_saud_hospital/src/core/widget/vertical_shimmer.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';

class SessionsCategoryBuilder extends StatelessWidget {
  const SessionsCategoryBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgrammesBloc, ProgrammesState>(
      builder: (context, state) {
        return switch (state.reqState) {
          ReqState.empty => const Text('empty'),
          ReqState.error => Text(state.message),
          ReqState.loading => const BuildShimmer(),
          //  ReqState.success => const HomeShimmer(),
          ReqState.success => SessionsCategory(
              category: state.programme,
            ),
        };
      },
    );
  }
}

class SessionsCategory extends StatelessWidget {
  final List<HomeSessionsModel> category;

  const SessionsCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        ListView.builder(
          itemCount: category.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            if (category[index].subcategories!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category[index].slug!.capitalizedFirst(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp, fontFamily: CustomFontFamily.medium),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 160.h,
                      child: ListViewHorizontal(
                        count: category[index].subcategories!.length,
                        itemBuilder: (_, subIndex) {
                          final subCat =
                              category[index].subcategories![subIndex];
                          return InkWell(
                            onTap: () {
                              List<String> dates = [];

                              for (var element in category[index]
                                  .subcategories![subIndex]
                                  .programs!) {
                                dates.add(element.customField!.sessionDate!);
                              }
                              context.pushNamed(Routes.sessionsScreen,
                                  //extra: subCat.programs,
                                  extra: FuckenSessionScreenParameters(
                                    appBarTitle: subCat.slug!,
                                    // dates: dates.reversed.toSet().toList(),
                                    dates: dates.sortDateStrings(),
                                    sessions: subCat.programs!,
                                  ));
                              //  queryParameters: {'params': dates});
                            },
                            child: Stack(
                              clipBehavior: Clip.antiAlias,
                              children: [
                                PositionedDirectional(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.backGroundColor,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              15.r),
                                    ),
                                    padding: EdgeInsetsDirectional.all(15.r),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppSvg.session,
                                              fit: BoxFit.cover,
                                              height: 35.h,
                                            ),
                                          ],
                                        ),
                                        35.verticalSpace,
                                        Text(
                                          subCat.slug!
                                              .capitalizeFirstLastSymbols(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontFamily:
                                                      CustomFontFamily.medium),
                                        ),
                                        10.verticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              subCat.programs!.length
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(fontSize: 13.sp),
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              AppStrings.conferences.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                PositionedDirectional(
                                  top: -20,
                                  start: -10,
                                  child: SvgPicture.asset(
                                    AppSvg.aa,
                                    fit: BoxFit.cover,
                                    height: 85.h,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class FuckenSessionScreenParameters extends Equatable {
  final List<String> dates;
  final List<HomePrograms> sessions;
  final String appBarTitle;

  const FuckenSessionScreenParameters({
    required this.dates,
    required this.sessions,
    required this.appBarTitle,
  });

  @override
  List<Object> get props => [dates, sessions, appBarTitle];
}
