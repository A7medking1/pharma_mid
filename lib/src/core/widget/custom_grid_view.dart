import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const CustomGridView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.physics,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.1 / 1.4,
        maxCrossAxisExtent: 300,
      ),
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
