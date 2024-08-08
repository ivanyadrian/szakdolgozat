import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/details.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/size.dart';
import '../../../styles/shadow.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
        child: Container(
          width: 180,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSize.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white,
          ),
          child: Column(
            children: [

              /// Thumbmail, wishlist button, discount
              TRoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(TSize.sm),
                backgroundColor: dark ? TColors.dark : TColors.light,

                child: const Stack(
                  children: [

                    /// Thumbmail image
                    TRoundedImage(imageUrl: TImages.cardImage1, applyImageRadius: true),

                    /// Sale Tag
                    /*Positioned(
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
                        top: 3,
                        right: 3,
                        child: TCircularIcon(icon: Iconsax.heart, color: Colors.red, height: 40,width: 40),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: TSize.spaceBetweenItems / 2),

              /// Deatils
              const Padding(
                  padding: EdgeInsets.only(right: TSize.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Kovács-tó', smallSize: true),
                      SizedBox(height: TSize.spaceBetweenItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Borsod-Abaúj-Zemplén'),
                      SizedBox(height: TSize.spaceBetweenItems),

                    ],
                  )
              ),
              const Spacer(),

              /// PRICE ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Price
                  //const TProductPriceText(price: '35.0'),

                  Padding(
                    padding: const EdgeInsets.only(left: TSize.sm),
                    child: Text('Tokaj', style: Theme.of(context).textTheme.titleLarge, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),

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
              ),
            ],
          ),
        ),
    );
  }
}

