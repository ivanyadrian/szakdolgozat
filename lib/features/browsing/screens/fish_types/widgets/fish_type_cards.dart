import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/features/browsing/screens/fish_types/widgets/fish_info_widget.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../common/styles/shadow.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/size.dart';
import '../models/fish_type_modell.dart';

class TFishTypeCards extends StatelessWidget {
  final FishTypeModel fishType;

  const TFishTypeCards({
    super.key,
    required this.fishType,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.dustWhite,
        ),
        child: Column(
          children: [

            /// Thumbnail
            TRoundedContainer(
              padding: const EdgeInsets.all(5),
              backgroundColor: dark ? TColors.dark : TColors.white,

              child: Stack(
                children: [
                  /// KÉP
                  Center(child: TRoundedImage(imageUrl: fishType.imageUrl, applyImageRadius: true, width: double.infinity)),
                  //TFishImageSlider(banners: [TImages.banner_1, TImages.banner_2, TImages.banner_3],)
                ],
              ),
            ),

            const SizedBox(height: TSize.spaceBetweenItems / 2),

            /// Details
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSize.sm),
                  child: Text(
                    fishType.name.toUpperCase(),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSize.spaceBetweenItems),

            Padding(
              padding: const EdgeInsets.all(TSize.md),
              child:
              TFishInfoWidget(information: fishType.information, livePlace: fishType.livePlace, season: fishType.season, feedingType: fishType.feedingType,),
            )
          ],
        ),
      ),
    );
  }
}

