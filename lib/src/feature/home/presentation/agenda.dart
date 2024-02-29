/*
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/show_alert_for_skip_sign_in.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.agenda.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: agendaItems
              .map(
                (e) => InkWell(
                  onTap: () {
                    // print(e);
                    //if (e.id == 1) {
                    final bool isUserSkipLogin =
                        sl<AppPreferences>().isSkipLogin();

                    if (isUserSkipLogin) {
                      showAlertForSkipSignIn(context);
                    } else {
                      context.pushNamed(Routes.programs);
                    }

                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AgendaWidgetItems(
                      agenda: e,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class AgendaWidgetItems extends StatelessWidget {
  const AgendaWidgetItems({
    super.key,
    required this.agenda,
  });

  final AgendaModel agenda;

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
                        agenda.icon,
                        height: 40,
                      ),
                      13.verticalSpace,
                      Text(
                        agenda.title.tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 22, fontFamily: CustomFontFamily.medium),
                      ),
                      7.verticalSpace,
                      SizedBox(
                        width: 200,
                        child: Text(
                          agenda.body.tr(),
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

const List<AgendaModel> agendaItems = [
  AgendaModel(
    id: 1,
    title: AppStrings.conferences,
    body: AppStrings.conferencesDesc,
    icon: AppSvg.agenda1,
  ),
  AgendaModel(
    id: 2,
    title: AppStrings.workshops,
    body: AppStrings.conferencesDesc,
    icon: AppSvg.agenda2,
  ),
  AgendaModel(
    id: 3,
    title: AppStrings.otherTopics,
    body: AppStrings.conferencesDesc,
    icon: AppSvg.agenda3,
  ),
];

class AgendaModel extends Equatable {
  final int id;

  final String title;
  final String body;

  final String icon;

  const AgendaModel({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
  });

  @override
  List<Object> get props => [id, title, body, icon];
}
*/
