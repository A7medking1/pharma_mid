import 'package:king_saud_hospital/src/core/resources/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImages extends StatelessWidget {
  final double? width;
  final BoxFit? fit;
  final String imageUrl;
  final double? height;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;

  const CachedImages({
    Key? key,
    this.width,
    this.placeholder,
    this.fit,
    this.height,
    this.imageBuilder,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 100.0,
      height: height,
      fit: fit,
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      placeholder: placeholder ?? (context, url) => Shimmer.fromColors(
        baseColor: AppColors.white2,
        highlightColor: AppColors.white,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}