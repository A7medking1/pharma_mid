import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/sessions_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/sessions_category.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/sessions_items.dart';

class SessionsScreen extends StatelessWidget {
  final FuckenSessionScreenParameters parameters;

  const SessionsScreen({Key? key, required this.parameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: parameters.appBarTitle.capitalizeFirstLastSymbols(),
      ),
      body: TabBarSessionsDays(
        parameters: parameters,
      ),
    );
  }
}

class TabBarSessionsDays extends StatefulWidget {
  final FuckenSessionScreenParameters parameters;

  const TabBarSessionsDays({Key? key, required this.parameters})
      : super(key: key);

  @override
  State<TabBarSessionsDays> createState() => _TabBarSessionsDaysState();
}

class _TabBarSessionsDaysState extends State<TabBarSessionsDays>
    with SingleTickerProviderStateMixin {
  late TabController? controller;

  List<HomePrograms> sessions = [];

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: widget.parameters.dates.length, vsync: this);

    for (var element in widget.parameters.sessions) {
      if (element.customField!.sessionDate == widget.parameters.dates[0]) {
        sessions.add(element);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TabBar(
            controller: controller,
            isScrollable: true,
            labelPadding: const EdgeInsetsDirectional.all(8),
            onTap: (value) {
              sessions.clear();
              for (var element in widget.parameters.sessions) {
                if (element.customField!.sessionDate ==
                    widget.parameters.dates[value]) {
                  sessions.add(element);
                }
              }
              setState(() {});
            },
            tabs: List.generate(
              widget.parameters.dates.length,
              (index) => Container(
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                ),
                child: Tab(
                  text: index == 0 ? 'Pre meeting' : 'Day $index',
                ),
              ),
            ),
          ),
          20.verticalSpace,
          Expanded(child: SessionsBuilder(session: sessions)),
        ],
      ),
    );
  }
}

class SessionsBuilder extends StatelessWidget {
  final List<HomePrograms> session;

  const SessionsBuilder({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: session.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return SessionsItems(
          session: session[index],
        );
      },
    );
  }
}
