import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constans/size.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusLg),
          topRight: Radius.circular(TSize.cardRadiusLg),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*
          Row(
            children: [

              const TCircularIcon(icon: Iconsax.map_1_copy,
              backgroundColor: TColors.darkerGrey,
              width: 40,
              height: 40,
              color: TColors.white,
              ),
              const SizedBox(width: TSize.spaceBetweenItems),

              Text('Lokáció', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: TSize.spaceBetweenItems),

              const TCircularIcon(icon: Iconsax.add_copy,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          */

          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Térkép megnyitása'))
        ],
      ),
    );
  }
}
