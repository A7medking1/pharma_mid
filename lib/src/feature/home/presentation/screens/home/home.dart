import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/sessions_category.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/home_app_bar.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/home_entry_id_check.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/home_search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              30.verticalSpace,
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const HomeSearch(),
                    30.verticalSpace,
                    const PosterWidget(),
                    30.verticalSpace,
                    const HomeEntryIdCheck(),
                    30.verticalSpace,
                    const PostersFloorPlaneWidget(),
                    const SessionsCategoryBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostersFloorPlaneWidget extends StatelessWidget {
  const PostersFloorPlaneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () => context.pushNamed(Routes.floorPlaneScreen),
            child: const FloorWidget(
              icon: AppImages.floor,
              title: 'Floor Plan',
            ),
          ),
          20.horizontalSpace,
          InkWell(
            onTap: () => context.pushNamed(Routes.glanceScreen),
            child: const FloorWidget(
              icon: AppImages.glance,
              title: 'Program at glance',
            ),
          ),
          20.horizontalSpace,
          InkWell(
            onTap: () => context.pushNamed(Routes.posterScreen),
            child: const FloorWidget(
              icon: AppImages.poster2,
              title: 'Posters',
            ),
          ),
        ],
      ),
    );
  }
}

class FloorWidget extends StatelessWidget {
  final String icon;
  final String title;

  const FloorWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        PositionedDirectional(
          child: Container(
            width: 105.w,
            //  height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.backGroundColor,
              borderRadius: BorderRadiusDirectional.circular(15.r),
            ),
            padding: EdgeInsetsDirectional.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      icon,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ],
                ),
                20.verticalSpace,
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontFamily: CustomFontFamily.medium,
                        fontSize: 13.sp,
                      ),
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
            height: 70.h,
          ),
        ),
      ],
    );
  }
}

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /* onTap: () {
        context.pushNamed(Routes.posterScreen);
      },*/
      child: Column(
        children: [
          Container(
            height: 80.h,
            decoration: const BoxDecoration(
                //   color: Colors.black
                ),
            child: Image.asset(
              AppImages.logoHome,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
            child: Container(
              height: 20.h,
              //width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFCCE1F7).withOpacity(0.5),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(25.r),
                  bottomStart: Radius.circular(25.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 40.w, end: 40.w),
            child: Container(
              height: 20.h,
              //width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFCCE1F7).withOpacity(0.2),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(25.r),
                  bottomStart: Radius.circular(25.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String image =
    'https://img.freepik.com/premium-vector/young-man-avatar-character_24877-9475.jpg?w=740';

List<String> list = [
  'auditorium-a',
  'auditorium-b',
  'auditorium-c',
  'auditorium1',
  'auditorium2'
];
