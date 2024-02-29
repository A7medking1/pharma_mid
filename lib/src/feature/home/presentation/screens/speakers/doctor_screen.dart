import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:king_saud_hospital/src/core/enums.dart';
import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:king_saud_hospital/src/core/resources/routes_manager.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/vertical_shimmer.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/controller/speakers_controller/speakers_bloc.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/home.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  final DoctorScreenParams params;

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  void didChangeDependencies() {
    context.read<SpeakersBloc>().isPaginated = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SpeakersBloc>();
    bloc.page = 1;
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: widget.params.catName,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 50.h, start: 10.w, end: 10.w, bottom: 30.h),
        child: BlocBuilder<SpeakersBloc, SpeakersState>(
          builder: (context, state) {
            if (state.reqState == ReqState.loading) {
              return const BuildShimmer();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: bloc.isPaginated
                        ? state.paginatedSpeakers.length
                        : widget.params.speakers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 7,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(Routes.doctorInformation,
                              extra: widget.params.speakers[index]);
                        },
                        child: DoctorItems(
                          speakers: bloc.isPaginated
                              ? state.paginatedSpeakers[index]
                              : widget.params.speakers[index],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.isPaginated = true;

                        if (bloc.page > 0) {
                          bloc.page--;
                          bloc.add(GetSpeakersEvent());
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    10.horizontalSpace,
                    Text(bloc.page.toString()),
                    10.horizontalSpace,
                    IconButton(
                      onPressed: () {
                        bloc.isPaginated = true;

                        bloc.page++;
                        bloc.add(GetSpeakersEvent());
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DoctorItems extends StatelessWidget {
  const DoctorItems({
    super.key,
    required this.speakers,
  });

  final Speakers speakers;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: AlignmentDirectional.topCenter,
        // width: double.infinity,
        height: 80.h,
        width: MediaQuery.sizeOf(context).width / 2,
        //  width: 170.w,
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadiusDirectional.circular(15.r),
        ),
        padding: const EdgeInsetsDirectional.all(15),
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: <Widget>[
            PositionedDirectional(
              top: -50,
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(
                  speakers.image == '' ? image : speakers.image,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Text(
                speakers.title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorScreenParams extends Equatable {
  final String catName;

  final List<Speakers> speakers;

  const DoctorScreenParams({
    required this.catName,
    required this.speakers,
  });

  @override
  List<Object> get props => [catName, speakers];
}
