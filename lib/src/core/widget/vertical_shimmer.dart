import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const BuildShimmerItems();
      },
    );
  }
}

class BuildShimmerItems extends StatelessWidget {
  const BuildShimmerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.black.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: buildBoxDecoration(),
                ),

                /*    SizedBox(
                  height: 100,
                  child: Row(
                    children: List.generate(4, (index) => SizedBox(
                      width: 100,
                      height: 100,
                    )),
                  ),
                )*/

                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 80.h,
                        width: 150,
                        decoration: buildBoxDecoration(),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Container(
                        height: 80.h,
                        width: 150.w,
                        decoration: buildBoxDecoration(),
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Container(
                        height: 80.h,
                        width: 150.w,
                        decoration: buildBoxDecoration(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration buildBoxDecoration() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.9),
    borderRadius: buildBorderRadius(),
  );
}

BorderRadiusDirectional buildBorderRadius() =>
    BorderRadiusDirectional.circular(15);

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (_, index) => 20.verticalSpace,
        itemBuilder: (context, index) {
          return Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.black.withOpacity(0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.h,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: buildBoxDecoration(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
