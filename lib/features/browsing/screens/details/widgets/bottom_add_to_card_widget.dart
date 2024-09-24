import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constans/size.dart';

class TOpenMapButton extends StatelessWidget {
  const TOpenMapButton({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Az elemek a széleken helyezkednek el
        children: [
          const Text('12.736, 31.123'), // Az íz szöveg
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSize.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Térkép megnyitása'),
          ),
        ],
      ),
    );
  }
}

