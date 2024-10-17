import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const SizedBox(height: TSize.spaceBetweenSections),

        /// Selecter Attributes pricing & description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSize.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// TITLE
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Stégek száma: ', showActionButton: false),
                  const SizedBox(width: TSize.spaceBetweenItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          /*
                          const TProductTitleText(title: 'Ár:', smallSize: true),
                          const SizedBox(width: TSize.spaceBetweenItems / 2),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSize.spaceBetweenItems),

                          /// SALE PRICE
                          const TProductPriceText(price: '20'),

                           */
                        ],
                      ),

                      /// STACK
                      Row(
                        children: [
                          //const TProductTitleText(title: 'Stock: ', smallSize: true),
                          Text('4',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: TSize.spaceBetweenItems),

              /// Variation Description
              const TProductTitleText(
                title:
                    'A helyek tulajdonságainak leírása itt kap helyet, mint pl stég hossza, környezeti tényezők stb',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSize.spaceBetweenSections),

        /// ATTRIBUTES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
                title: 'Opciók', showActionButton: false),
            const SizedBox(height: TSize.spaceBetweenItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'A', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'B', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'C', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'D', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
