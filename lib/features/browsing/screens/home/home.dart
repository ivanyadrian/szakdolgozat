
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/browsing/screens/all_products/all_products.dart';
import 'package:szakdolgozat_app/features/browsing/screens/home/widgets/home_appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/home/widgets/home_categories.dart';
import 'package:szakdolgozat_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:szakdolgozat_app/features/browsing/screens/home/widgets/promo_slider.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// APPBAR
                  THomeAppBar(),
                  SizedBox(height: TSize.spaceBetweenSections),

                  /// SEARCHBAR
                  TSearchContainer(text: 'Keresés...'),
                  SizedBox(height: TSize.spaceBetweenSections),

                  /// CATEGORIES
                  Padding(
                    padding: EdgeInsets.only(left: TSize.defaultSpace),
                    child: Column(
                      children: [
                        /// HEADING
                        TSectionHeading(
                            title: 'Vármegyék szerint',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: TSize.spaceBetweenItems),

                        /// CATEGORIES
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSize.spaceBetweenSections),
                ],
              ),
            ),

            /// BODY
            Padding(
                padding: const EdgeInsets.all(TSize.defaultSpace),
                child: Column(
                  children: [
                    /// BANNER SLIDER
                    const TPromoSlider(banners: [TImages.banner_1, TImages.banner_2, TImages.banner_3]),
                    const SizedBox(height: TSize.spaceBetweenSections),

                    /// HEADING
                    TSectionHeading(title: 'Felkapott Helyek', onPressed: () => Get.to(() => const AllProducts())),
                    const SizedBox(height: TSize.spaceBetweenItems),

                    /// POPULAR
                    TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
