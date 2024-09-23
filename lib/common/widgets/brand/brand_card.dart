import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../utils/constans/colors.dart';
import '../../../utils/constans/enums.dart';
import '../../../utils/constans/size.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../text/t_brand_title_text_with_verified_icon.dart';


import 'county_image_provider.dart'; // Importáld a CountyImageProvider-t

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    required this.countyName,
    required this.spotCount,
    this.onTab,
  });

  final bool showBorder;
  final void Function()? onTab;
  final String countyName;
  final int spotCount;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Kép kiválasztása a megye neve alapján a CountyImageProvider segítségével
    String imagePath = CountyImageProvider.getImagePath(countyName);

    return GestureDetector(
      onTap: onTab,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// ICON
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: imagePath, // Dinamikus kép
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.darkerGrey.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: TSize.spaceBetweenItems / 2),

            /// TEXT
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: countyName,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '$spotCount', // Helyek száma dinamikusan
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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

