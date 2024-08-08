import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/images/rounded_image.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/size.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          /// THUMBNAIL
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: const Stack(
              children: [
                /// THUMNAIL IMAGE
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.cardImage1, fit: BoxFit.cover),
                ),

                /*
                /// Sale Tag
                Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSize.sm,
                        backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),

                        child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),

                      ),
                    ),

                 */

                /// Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart, color: Colors.red, height: 35,width: 35, size: 20),
                ),
              ],
            ),
          ),
          
          /// DETAILS
          SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Kovács-tó', smallSize: true),
                      SizedBox(height: TSize.spaceBetweenItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Borsod-Abaúj-Zemplén'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text('Tokaj', style: Theme.of(context).textTheme.titleLarge, maxLines: 2, overflow: TextOverflow.ellipsis)),

                      /// ADD TO CART
                      Container(
                        decoration: BoxDecoration(
                          color: dark ? TColors.dark : TColors.light,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(TSize.cardRadiusMd),
                            bottomRight: Radius.circular(TSize.productImageRadius),
                          ),
                        ),

                        child: SizedBox(
                          width: TSize.iconLg * 1.2,
                          height: TSize.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.arrow_right_3_copy, color: dark ? TColors.white : TColors.dark)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
