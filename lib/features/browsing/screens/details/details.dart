import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/bottom_add_to_card_widget.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_detail_image_slider.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_meta_data.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/rating_share_widget.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TOpenMapButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// kiválasztott helyre koppintás utáni képek
            const TProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSize.defaultSpace,
                  left: TSize.defaultSpace,
                  bottom: TSize.defaultSpace),
              child: Column(
                children: [
                  /// - rating & share ICON / BUTTON
                  const TRatingAndShare(),
                  const Divider(),

                  /// -Price, Title, Stack, & Share
                  const TProductMetaData(),

                  const SizedBox(height: TSize.spaceBetweenSections),
                  /// Típus Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(TSize.md),
                    decoration: BoxDecoration(
                        color: dark? TColors.black : TColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: dark? TColors.darkerGrey : TColors.grey, width: 2)

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Típusa: ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // Make it bold
                          ),
                        ),
                        Text('Tó'),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),

                  /// Horgászatra kijelölt helyek száma Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(TSize.md),
                    decoration: BoxDecoration(
                        color: dark? TColors.black : TColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: dark? TColors.darkerGrey : TColors.grey, width: 2)

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Horgászatra kijelölt helyek száma:',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // Make it bold
                          ),
                        ),
                        Text('17 db'),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),


                  /// Leírás Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(TSize.defaultSpace),
                    decoration: BoxDecoration(
                      color: dark? TColors.black : TColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: dark? TColors.darkerGrey : TColors.grey, width: 2)
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeading(
                          title: 'Leírás',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSize.spaceBetweenItems),

                        const ReadMoreText(
                          'aslfjaijsdbldsklbksdébs-éblsádbásdoiwufioewifjweioweiuiwejwnvklewjoivéhwrubhfbJKHABHALBHFDHBFDHBDAKJBKJBLB',
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '  Több',
                          trimExpandedText: '  Kevesebb',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Vélemények (375)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3_copy, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBetweenSections),
                  */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

