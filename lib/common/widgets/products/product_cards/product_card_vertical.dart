import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/products/favourite/favourite_icon.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/details.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../../features/browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/size.dart';
import '../../../styles/shadow.dart';
import '../../images/rounded_image.dart';
import '../../text/product_title_text.dart';
import '../../text/t_brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String waterType;
  final String countyName;
  final String settlementName;
  final FishingSpotModel fishingSpot; // Pass the entire fishing spot for details

  const TProductCardVertical({
    required this.imageUrl,
    required this.placeName,
    required this.waterType,
    required this.countyName,
    required this.settlementName,
    required this.fishingSpot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(fishingSpot: fishingSpot)),
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
            /// Thumbnail, wishlist button, discount
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  TRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    width: double.infinity, // Ensure the image takes full width
                    height: double.infinity, // Ensure the image takes full height
                    fit: BoxFit.cover,
                    isNetworkImage: true,
                    // Make sure the image covers the entire area
                  ),

                  /// Favourite Icon Button
                  Positioned(
                    top: 3,
                    right: 3,
                    child: TFavouriteIcon(productId: fishingSpot.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenItems / 2),

            /// Details
            Padding(
              padding: EdgeInsets.only(right: TSize.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: TSize.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TProductTitleText(
                            title: placeName,
                            smallSize: true,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSize.spaceBetweenItems / 2),
                  Padding(
                    padding: const EdgeInsets.only(left: TSize.sm),
                    child: TBrandTitleWithVerifiedIcon(title: countyName),
                  ),
                  SizedBox(height: TSize.spaceBetweenItems),
                ],
              ),
            ),
            const Spacer(),

            /// Settlement name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: TSize.sm),
                    child: Text(
                      settlementName,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                    child: Center(
                      child: Icon(
                        Iconsax.arrow_right_3_copy,
                        color: dark ? TColors.white : TColors.dark,
                      ),
                    ),
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



