import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';

import '../../../../../common/widgets/brand/brand_showcase_case.dart';
import '../../../../../utils/constans/image_strings.dart';
import '../../../../../utils/constans/size.dart';
import '../../../models/county_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.county});

  final CountyModel county;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [

              /// --BRANDS
              const TBrandShowcase(images: [TImages.somogy, TImages.gyor_moson_sopron, TImages.budapest]),
              const TBrandShowcase(images: [TImages.somogy, TImages.gyor_moson_sopron, TImages.budapest]),
              const SizedBox(height: TSize.spaceBetweenItems),

              /// PRODUCTS
              TSectionHeading(title: 'Esetleg tetszhet', onPressed: () {}),
              const SizedBox(height: TSize.spaceBetweenItems),

              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
              const SizedBox(height: TSize.spaceBetweenSections),

            ],
          ),
        ),
      ],
    );
  }
}
