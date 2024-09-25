import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/bottom_add_to_card_widget.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_detail_image_slider.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_meta_data.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/rating_share_widget.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../upload_new_element/model/fishing_spot_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final FishingSpotModel fishingSpot; // Add the fishing spot data

  const ProductDetailScreen({required this.fishingSpot, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TOpenMapButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// kiválasztott helyre koppintás utáni képek
            TProductImageSlider(imageUrls: fishingSpot.imageUrls), // Pass the image URLs

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSize.defaultSpace,
                  left: TSize.defaultSpace,
                  bottom: TSize.defaultSpace),
              child: Column(
                children: [
                  /// - rating & share ICON / BUTTON
                  TRatingAndShare(placeName: fishingSpot.placeName), // Pass the place name
                  const Divider(),

                  /// -Price, Title, Stack, & Share
                  TProductMetaData(
                    settlementName: fishingSpot.settlementName,
                    countyName: fishingSpot.countyName,
                  ), // Pass settlement and county data

                  const SizedBox(height: TSize.spaceBetweenSections),

                  /// Típus Box
                  _buildInfoBox(
                    context: context,
                    title: 'Típusa',
                    value: fishingSpot.waterType, // Pass the water type
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),

                  /// Horgászatra kijelölt helyek száma Box
                  _buildInfoBox(
                    context: context,
                    title: 'Horgászatra kijelölt helyek száma',
                    value: fishingSpot.numberOfSpots.toString(), // Pass the number of spots
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),

                  /// Leírás Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(TSize.defaultSpace),
                    decoration: BoxDecoration(
                      color: dark ? TColors.black : TColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: dark ? TColors.darkerGrey : TColors.grey,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeading(
                          title: 'Leírás',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSize.spaceBetweenItems),
                        ReadMoreText(
                          fishingSpot.description, // Pass the description
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '  Több',
                          trimExpandedText: '  Kevesebb',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to reduce repetition for info boxes
  Widget _buildInfoBox({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSize.md),
      decoration: BoxDecoration(
        color: dark ? TColors.black : TColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: dark ? TColors.darkerGrey : TColors.grey,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}


