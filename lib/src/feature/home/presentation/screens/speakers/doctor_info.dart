import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/resources/style.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/feature/home/data/model/speakers_model.dart';
import 'package:king_saud_hospital/src/feature/home/presentation/screens/home/home.dart';

class DoctorInformation extends StatelessWidget {
  const DoctorInformation({super.key, required this.speaker});

  final Speakers speaker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: '',
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.transparent,
                  backgroundImage: CachedNetworkImageProvider(
                    speaker.image == '' ? image : speaker.image,
                  ),
                ),
                10.verticalSpace,
                Text(
                  speaker.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 17.sp,
                        fontFamily: CustomFontFamily.medium,
                      ),
                ),
                8.verticalSpace,
                /*   Text(
                  doctor.docJob,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.grey.withOpacity(
                          0.9,
                        ),
                      ),
                ),*/
                /*  8.verticalSpace,*/
                /*   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvg.location,
                      height: 15,
                    ),
                    6.horizontalSpace,
                    */ /*    Text(
                      'القاهرة , مصر',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.grey.withOpacity(0.9),
                          ),
                    ),*/ /*
                  ],
                ),*/
                35.5.verticalSpace,
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.abstract.tr(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontFamily: CustomFontFamily.medium,
                            fontSize: 14.sp),
                      ),
                      16.verticalSpace,
                      Html(
                        data: speaker.content,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

String text =
    'يعمل البروفيسور فيكرام دورايراج حاليًا كشريك إداري في TOC Eye and Face وهو أستاذ طب العيون في كلية ديل الطبية بجامعة تكساس في أوستن. وهو مدير زمالة الجمعية الأمريكية لجراحة العيون التجميلية والترميمية ومدرس زمالة AACS لجراحة تجميل الوجه في TOC Eye and Face. وقد تم اختياره ضمن قائمة أفضل الأطباء في US News and World Report، وأفضل أطباء العيون في أمريكا، وأفضل الأطباء في أمريكا، وTexas Super Doctors، وTX TopDocs، وأفضل الأطباء في أوستن.';
