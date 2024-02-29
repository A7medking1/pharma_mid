import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';

class SessionsSubScreen extends StatelessWidget {
  final List<HomeSubcategories> subCategory;

  const SessionsSubScreen({Key? key, required this.subCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SessionsSubcategories(
        subCategory: subCategory,
      ),
    );
  }
}

class SessionsSubcategories extends StatelessWidget {
  final List<HomeSubcategories> subCategory;

  const SessionsSubcategories({Key? key, required this.subCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: subCategory.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          if (subCategory[index].programs!.isEmpty) {
            return const SizedBox.shrink();
          }

          return InkWell(
            onTap: () {
              context.pushNamed(Routes.sessionsScreen,
                  extra: subCategory[index].programs);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: AppColors.backGroundColor,
                padding: const EdgeInsetsDirectional.all(25),
                width: MediaQuery.sizeOf(context).width,
                alignment: AlignmentDirectional.center,
                //  height: 100,
                child: Column(
                  children: [
                    Text(
                      subCategory[index].slug!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
