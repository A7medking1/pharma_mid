import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/list_view_horizontal.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.sponsors.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SponsorBuilderWidget(title: 'Partners',images: partners,),
            50.verticalSpace,
            SponsorBuilderWidget(title: 'Diamond',images: diamond,),
            50.verticalSpace,
            SponsorBuilderWidget(title: 'Gold',images: gold,),
            50.verticalSpace,
            SponsorBuilderWidget(title: 'Sliver',images: sliver,),
          ],
        ),
      ),
    );
  }
}

class SponsorBuilderWidget extends StatelessWidget {
  const SponsorBuilderWidget({
    super.key, required this.images, required this.title,
  });

  final List<String> images ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 22.sp),
        ),
        15.verticalSpace,
        SizedBox(
          height: 60.h,
          child: ListViewHorizontal(
            count: images.length,
            separatorBuilder: (_,index) => 50.horizontalSpace,
            itemBuilder: (_, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
               // width: 120,
              );
            },
          ),
        ),
      ],
    );
  }
}

final List<String> partners = [
  sponsorsPath('p1'),
  sponsorsPath('p2'),
  sponsorsPath('p3'),
  sponsorsPath('p4'),
];

final List<String> diamond = [
  sponsorsPath('d1'),
  sponsorsPath('d2'),
  sponsorsPath('d3'),
];

final List<String> gold = [
  sponsorsPath('g1'),
  sponsorsPath('g2'),
  sponsorsPath('g3'),
  sponsorsPath('g4'),
];

final List<String> sliver = [
  sponsorsPath('s1'),
  sponsorsPath('s2'),
  sponsorsPath('s3'),
  sponsorsPath('s4'),
];

String sponsorsPath(String path) => 'assets/images/sponsors/$path.jpeg';
