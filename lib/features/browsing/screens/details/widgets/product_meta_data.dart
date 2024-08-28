import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/constans/enums.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {

    //final dark = THelperFunctions.isDarkMode(context);

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*
        /// PRICE & SALE PRICE
        Row(
          children: [
            /// SALE TAG
            TRoundedContainer(
              radius: TSize.sm,
              backgroundColor: TColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSize.spaceBetweenItems),

            /// PRICE
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSize.spaceBetweenItems),
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems * 1.5),
         */


        /// TITLE

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TBrandTitleWithVerifiedIcon(title: 'Tokaj Kovács-tó', brandTextSizes: TextSizes.medium),
            TProductTitleText(title: 'Borsod-Abaúj-Zemplén'),

          ],
        ),
        SizedBox(height: TSize.spaceBetweenItems),


        /// BRAND

        /// STACK STATUS
        /*
        Row(
          children: [
            const TProductTitleText(title: 'Státusz: '),
            const SizedBox(width: TSize.spaceBetweenItems),
            Text('Van szabad időpont a héten', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        */
      ],
    );
  }
}
