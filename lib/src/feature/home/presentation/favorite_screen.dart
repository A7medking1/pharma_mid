import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/vertical_shimmer.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/favorite/favorite_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/widget/sessions_items.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<FavoriteBloc>().add(const GetFavoriteEvent(true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.favorite.tr(),
      ),
      body: const _FavScreenBody(),
    );
  }
}

class _FavScreenBody extends StatelessWidget {
  const _FavScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavoriteBloc>();
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return switch (state.getReqState) {
          ReqState.loading => const Padding(
              padding: EdgeInsetsDirectional.all(25),
              child: HomeShimmer(),
            ),
          ReqState.error => Center(
              child: Text(state.message),
            ),
          ReqState.empty => Center(
              child: Text(state.message),
            ),
          ReqState.success => Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: state.items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SessionsItems(
                    session: state.items[index],
                    isFavScreen: true,
                  );
                },
              ),
            )
        };
      },
    );
  }
}
