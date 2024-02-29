/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/small_button.dart';
import 'package:king_saud_hospital/src/core/widget/vertical_shimmer.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/programmes/programmes_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/home.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProgrammesBloc>().add(GetAgendaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.conferences.tr(),
      ),
      body: const _BodyProgramsScreen(),
    );
  }
}

class _BodyProgramsScreen extends StatelessWidget {
  const _BodyProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgrammesBloc, ProgrammesState>(
      builder: (context, state) {
        return switch (state.agendaReqState) {
          ReqState.empty => Center(
              child: Text(
                'EMPTY',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ReqState.loading => const HomeShimmer(),
          ReqState.error => Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          //    ReqState.success => const AgendaBuilder(),
          ReqState.success => Center(
              child: Text(
                'EMPTY',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
        };
      },
    );
  }
}

class AgendaBuilder extends StatelessWidget {
  const AgendaBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const AgendaProgrammes();
        },
      ),
    );
  }
}

class AgendaProgrammes extends StatelessWidget {
  const AgendaProgrammes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: InkWell(
        onTap: () {
          //   context.pushNamed(Routes.programsDetails);
        },
        child: FittedBox(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsetsDirectional.all(15),
              decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadiusDirectional.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Align(
                            widthFactor: 0.6,
                            child: CircleAvatar(
                              radius: 19,
                              backgroundImage:
                                  CachedNetworkImageProvider(image),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.place.tr(),
                            style: const TextStyle(fontSize: 10),
                          ),
                          5.verticalSpace,
                          Text(
                            'قاعة الملك سليمان',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.theFirstTrack.tr(),
                            style: const TextStyle(fontSize: 11),
                          ),
                          Text(
                            'قسم جراحة \n العيون ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 17,
                                    fontFamily: CustomFontFamily.medium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 110.w,
                            //  alignment: AlignmentDirectional.center,
                            child: CustomSmallButton(
                              onPressed: () {},
                              text: AppStrings.activateNotifications.tr(),
                            ),
                          ),
                          20.horizontalSpace,
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              AppSvg.heart,
                              height: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
