import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/app_prefs/app_prefs.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/list_tile_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.language.tr(),
      ),
      body: const _LangScreenContent(),
    );
  }
}

enum ChooseLang { arabic, english }

ChooseLang _lang = ChooseLang.arabic;

class _LangScreenContent extends StatefulWidget {
  const _LangScreenContent({Key? key}) : super(key: key);

  @override
  State<_LangScreenContent> createState() => _LangScreenContentState();
}

class _LangScreenContentState extends State<_LangScreenContent> {
  @override
  void initState() {
    super.initState();
    if (sl<AppPreferences>().getAppLang() == 'en') {
      _lang = ChooseLang.english;
    } else {
      _lang = ChooseLang.arabic;
    }
    // print(_lang.name);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            CustomListTileWidget(
                onTap: () {
                  setState(() {
                    _lang = ChooseLang.arabic;
                    sl<AppPreferences>().changeAppLang();
                    Phoenix.rebirth(context);
                  });
                },
                title: AppStrings.arabic.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
                fontColor: Colors.black,
                trailingWidget: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: _lang.name == 'arabic'
                        ? AppColors.primary
                        : const Color(0xFFB6B6B6),
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _lang.name == 'arabic'
                            ? AppColors.primary
                            : AppColors.white,
                      ),
                    ),
                  ),
                )),
            CustomListTileWidget(
                onTap: () {
                  setState(() {
                    _lang = ChooseLang.arabic;
                    sl<AppPreferences>().changeAppLang();
                    Phoenix.rebirth(context);
                  });
                },
                title: AppStrings.english.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
                fontColor: Colors.black,
                trailingWidget: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: _lang.name == 'english'
                        ? AppColors.primary
                        : const Color(0xFFB6B6B6),
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _lang.name == 'english'
                            ? AppColors.primary
                            : AppColors.white,
                      ),
                    ),
                  ),
                )),

            /*     RadioListTile(
              title: Text(AppStrings.english.tr()),
              value: ChooseLang.english,
              groupValue: _lang,
              onChanged: (newValue) {
                setState(() {
                  _lang = newValue!;
                  sl<AppPreferences>().changeAppLang();
                  Phoenix.rebirth(context);
                  //context.setLocale(englishLocal);
                });
              },
            ),
            RadioListTile(
              title: Text(AppStrings.arabic.tr()),
              value: ChooseLang.arabic,
              groupValue: _lang,
              onChanged: (newValue) {
                setState(() {
                  _lang = newValue!;
                  sl<AppPreferences>().changeAppLang();
                  Phoenix.rebirth(context);
                });
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
