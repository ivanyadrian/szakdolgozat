import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/images/t_circular_image.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/size.dart';
import '../../../utils/helpers/helper_functions.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBetweenItems),
        child: Column(
          children: [
            TCircularImage(
              image: image,
              fit:  BoxFit.fitWidth,
              padding: TSize.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColors.light : TColors.dark,
            ),

            /// TEXT
            const SizedBox(height: TSize.spaceBetweenItems / 2),
            SizedBox(
              width: 55,
              child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
