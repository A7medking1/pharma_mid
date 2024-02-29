import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/hepler.dart';
import 'package:king_saud_hospital/src/core/resources/app_assets.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/cat_doctors_screen.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/speakers/doctor_screen.dart';

class DoctorSubCatScreen extends StatelessWidget {
  final DoctorSubCatParameters params;

  const DoctorSubCatScreen({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: params.name),
      body: DoctorSubCatScreenBody(
        subcategories: params.model.subcategories,
      ),
    );
  }
}

class DoctorSubCatScreenBody extends StatelessWidget {
  const DoctorSubCatScreenBody({super.key, required this.subcategories});

  final List<Subcategories> subcategories;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SpeakersBloc>();

    return FadeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: subcategories.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                bloc.subCatIndex = index ;

               // print(bloc.catIndex.toString() + " => " + bloc.subCatIndex.toString());

                context.pushNamed(
                  Routes.doctors,
                  extra: DoctorScreenParams(
                    catName: subcategories[index].name,
                    speakers: subcategories[index].speakers,
                  ),
                );
              },
              child: SpeakersCatWidgetItems(
                icon: AppSvg.agenda1,
                name: subcategories[index].name,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DoctorSubCatParameters extends Equatable {
  final SpeakersModel model;

  final String name;

  const DoctorSubCatParameters({
    required this.model,
    required this.name,
  });

  @override
  List<Object> get props => [model, name];
}
