import 'package:flutter/material.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/image_strings.dart';
import '../../../../utils/constans/size.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../text/t_brand_title_text_with_verified_icon.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// IMAGES
        TRoundedImage(
          imageUrl: TImages.cardImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSize.spaceBetweenItems),

        /// TITLE
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Kovács-tó'),
              const Flexible(child: TBrandTitleWithVerifiedIcon(title: 'Borsod-Abaúj-Zemplén')),

              /// ATTRIBÚTUM
              Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Település ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Tokaj ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Stég ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'E', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
