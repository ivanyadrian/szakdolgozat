import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../utils/constans/enums.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/size.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../text/t_brand_title_text_with_verified_icon.dart';

class TWaterTypesByCounty extends StatelessWidget {
  const TWaterTypesByCounty({
    super.key,
    required this.showBorder,
    this.onTab,
    required this.waterType,
    required this.count,
  });

  final bool showBorder;
  final void Function()? onTab;
  final String waterType; // víztípus
  final int count; // darabszám

  // Helper function to get the appropriate image for each water type
  String _getWaterTypeImage(String waterType) {
    switch (waterType.toLowerCase()) {
      case 'tó':
        return TImages.lake;
      case 'folyó':
        return TImages.river;
      case 'csatorna':
        return TImages.canal;
      case 'patak':
        return TImages.brook;
      case 'mocsár':
        return TImages.swamp;
      default:
        return TImages.placeholder;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTab,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Középre igazítás
          crossAxisAlignment: CrossAxisAlignment.center, // Vertikális igazítás középre
          children: [

            /// IMAGE
            SizedBox( // Meghatározott méretű hely a képnek
              width: 50.0, // Állítsd be a kívánt szélességet
              child: TCircularImage(
                isNetworkImage: false,
                image: _getWaterTypeImage(waterType),
              ),
            ),
            const SizedBox(width: TSize.spaceBetweenItems),

            /// TEXT
            Expanded( // Az egész maradék helyet felhasználja
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: waterType,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    'helyek száma: $count',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center, // Középre igazítás
                  ),
                ],
              ),
            ),

            /// ARROW ICON
            Padding(
              padding: const EdgeInsets.only(left: TSize.sm),
              child: Icon(
                Icons.arrow_forward_ios,
                size: TSize.md, // Méret igazítása szükség szerint
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



