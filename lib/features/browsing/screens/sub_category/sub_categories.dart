import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/images/rounded_image.dart';
import 'package:szakdolgozat_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
          title: Text('Borsod-Abaúj-Zemplén vármegye'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.banner_1,
                  applyImageRadius: true),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// SUB-CATEGORIES
              Column(
                children: [
                  /// HEADING
                  TSectionHeading(title: 'Népszerűek', onPressed: () {}),
                  const SizedBox(height: TSize.spaceBetweenItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSize.spaceBetweenItems),
                        itemBuilder: (context, index) => const TProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
