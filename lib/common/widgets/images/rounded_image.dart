import 'package:flutter/material.dart';
import '../../../utils/constans/size.dart';
import '../shimmers/shimmer.dart'; // Make sure you have shimmer package included


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSize.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isNetworkImage
            ? FutureBuilder<void>(
                future: _precacheImage(imageUrl, context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return TShimmerEffect(
                      width: width!,
                      height: height!,
                      radius: applyImageRadius ? borderRadius : 0,
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Hiba a kép betöltése közben'));
                  } else {
                    return ClipRRect(
                      borderRadius: applyImageRadius
                          ? BorderRadius.circular(borderRadius)
                          : BorderRadius.zero,
                      child: Image.network(
                        imageUrl,
                        fit: fit,
                      ),
                    );
                  }
                },
              )
            : ClipRRect(
                borderRadius: applyImageRadius
                    ? BorderRadius.circular(borderRadius)
                    : BorderRadius.zero,
                child: Image.asset(
                  imageUrl,
                  fit: fit,
                ),
              ),
      ),
    );
  }

  Future<void> _precacheImage(String url, BuildContext context) async {
    final image = Image.network(url);
    await precacheImage(image.image, context);
  }
}
