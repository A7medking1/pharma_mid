import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:king_saud_hospital/src/core/resources/app_strings.dart';
import 'package:king_saud_hospital/src/core/widget/appBar.dart';
import 'package:king_saud_hospital/src/core/widget/cached_image_network.dart';
import 'package:king_saud_hospital/src/feature/auth/presentation/screens/sign_in/widget/form_field.dart';
import 'package:permission_handler/permission_handler.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({Key? key}) : super(key: key);

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: AppStrings.posters.tr(),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 10.w,
          end: 10.w,
          top: 20.h,
          bottom: 20.h,
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (int value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (_, index) {
                return InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20.0),
                  minScale: 1.0,
                  maxScale: 3.6,
                  child: CachedImages(
                    imageUrl: imageUrls[index],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      saveImageToGallery(imageUrls[currentPage]);
                    },
                    icon: const Icon(
                      Icons.save_alt,
                    ),
                  ),
                  Text(
                    '${currentPage + 1} / ${imageUrls.length}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> imageUrls = [
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975959/ohyma052c5dedvivtz9o.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975958/ztlrl25rdannmdacneql.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975957/shnvhn3revc58poinegi.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975956/mhvdxhil04ze11o67qu8.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975955/cev8dsjpyfegfcdc52yw.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975955/inkcypx0pw1fuggw6a0d.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975954/dfjejwxfqivymqjgqoqx.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975953/djk9uhipzu0mkcreztau.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975951/doho9mk71azmfvcjah7n.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975951/zfyk1kn22qhrbv6oojrw.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975950/j86w3picgnjmltsqjcft.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975949/ciwyx8pr6vi3pck7exiv.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975946/t9jjav9bbssw2pphvclp.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975949/vkfyi5skot91cu3d9yai.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975948/vkf6ruv194mvofj52fz5.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975946/t9jjav9bbssw2pphvclp.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975946/bqav6ct1qfv5uz0jvhmi.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975945/yqjzageszcu9vbepyjkf.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975944/pjbrgqabzzwtjngypgz4.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975944/pjbrgqabzzwtjngypgz4.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975933/wupaytaejjhepo9bqiax.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975932/makc6vtxcwjf1lp3cp98.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975932/makc6vtxcwjf1lp3cp98.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975929/nbhvs8uwokurknspzc1m.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975925/rbrktocdj67jilwem4qt.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975922/fse3tga2nkcbhouc6o2r.jpg",
  "https://res.cloudinary.com/dd4uomdxt/image/upload/v1696975916/mlokakud4kweqmcckoxp.jpg",
];

Future<void> saveImageToGallery(String imageUrl) async {
  // Check and request storage permission
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  if (status.isGranted) {
    try {
      // Download the image
      Dio dio = Dio();
      Response<List<int>> response = await dio.get<List<int>>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // Save the image to the gallery
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data!));
      if (kDebugMode) {
        print(result);
      }

      showToast(msg: 'saved image success', state: ToastStates.SUCCESS);
    } catch (e) {
      if (kDebugMode) {
        print("Error saving image: $e");
      }
      showToast(msg: 'Error saving image', state: ToastStates.ERROR);
    }
  } else {
    showToast(msg: 'Permission denied', state: ToastStates.ERROR);
    if (kDebugMode) {
      print("Permission denied");
    }
  }
}
