import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/services/index.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/custom_text_formField.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/search/search_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/sessions_items.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: AppStrings.search.tr(),
        ),
        body:  _SearchBody(),
      ),
    );
  }
}

class _SearchBody extends StatefulWidget {
  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  late TextEditingController query;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    query.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextFormField(
                controller: query,
                title: '',
                onChanged: (String? value) {
                  context
                      .read<SearchBloc>()
                      .add(GetSearchEvent(query: value!.trim()));
                },
                prefixIcon: const PrefixIcon(),
                hintText: AppStrings.searchForCourses.tr(),
              ),
              if (state.reqState == ReqState.loading) ...[
                5.verticalSpace,
                const LinearProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                ),
              ],
              10.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: state.search.length,
                  itemBuilder: (context, index) {
                    return SessionsItems(
                      session: state.search[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      child: SvgPicture.asset(
        AppSvg.search,
      ),
    );
  }
}
