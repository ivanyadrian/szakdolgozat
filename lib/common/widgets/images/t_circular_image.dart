import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/size.dart';
import '../../../utils/helpers/helper_functions.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/size.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover, // Alapértelmezett értéknek a BoxFit.cover-t javaslom
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSize.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
          width: double.infinity, // A kép kitöltse a rendelkezésre álló szélességet
          height: double.infinity, // A kép kitöltse a rendelkezésre álló magasságot
          fit: fit, // Biztosítsd, hogy a kép kitöltse a helyet
          color: overlayColor,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const TShimmerEffect(width: 80, height: 80, radius: 80),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
            : Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: fit,
          color: overlayColor,
        ),
      ),
    );
  }
}

