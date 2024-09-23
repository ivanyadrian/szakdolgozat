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
    this.fit = BoxFit.cover,
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
  final Color? backgroundColor; // Módosítás: háttérszín
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            backgroundColor ?? // Ha nincs háttérszín, használd az alapértelmezett színt
                (THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(width: 80, height: 80, radius: 80),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
