import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/bottom_add_to_card_widget.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_Attributes.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_detail_image_slider.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_meta_data.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/rating_share_widget.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// kiválasztott helyre koppintás utáni képek
            const TProductImageSlider(),

            /// Product Details
            Padding(
                padding: const EdgeInsets.only(right: TSize.defaultSpace, left: TSize.defaultSpace, bottom: TSize.defaultSpace),
                child: Column(
                  children: [
                    /// - rating & share ICON / BUTTON
                    const TRatingAndShare(),

                    /// -Price, Title, Stack, & Share
                    const TProductMetaData(),

                    /// ATTRIBUTES ITT VANNAK AZ OPCIÓK: A, B, C, D ...
                    const TProductAttributes(),
                    const SizedBox(height: TSize.spaceBetweenSections),

                    /// BOOKING BUTTON
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Ugrás az időpontokhoz'))),
                    const SizedBox(height: TSize.spaceBetweenSections),

                    /// Description
                    const TSectionHeading(title: 'Leírás', showActionButton: false),
                    const SizedBox(height: TSize.spaceBetweenSections),
                    const ReadMoreText(
                      'Egy egy almafa kettő két asddddddddddddddasddddddddddddddddddddddddddddddddddkativa három hátom kiskacsa egy kettő három négy négy póniló',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '  Több',
                      trimExpandedText: '  Kevesebb',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),

                    const Divider(),
                    const SizedBox(height: TSize.spaceBetweenItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(title: 'Vélemények (375)', showActionButton: false),
                        IconButton(icon: const Icon(Iconsax.arrow_right_3_copy, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                      ],
                    ),
                    const SizedBox(height: TSize.spaceBetweenSections),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
