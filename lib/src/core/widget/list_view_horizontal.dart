import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewHorizontal extends StatelessWidget {
  final double? height;
  final double? width;
  final int count;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const ListViewHorizontal({
    Key? key,
     this.height,
    required this.count,
    required this.itemBuilder,
    this.separatorBuilder,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        physics: const BouncingScrollPhysics(),
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder ??
                (BuildContext context, int index) {
              return 20.horizontalSpace;
            },
      ),
    );
  }
}
