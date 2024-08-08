import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/size.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/t_circular_icon.dart';



class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus_copy,
          width: 32,
          height: 32,
          size: TSize.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBetweenItems),
        Text('2',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSize.spaceBetweenItems),
        const TCircularIcon(
          icon: Iconsax.add_copy,
          width: 32,
          height: 32,
          size: TSize.md,
          color: TColors.white,
          backgroundColor: TColors.primaryColor,
        ),
      ],
    );
  }
}