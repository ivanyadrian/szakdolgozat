import 'package:flutter/material.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/size.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const  EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBetweenItems),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSize.spaceBetweenItems),

          /// Brand Top & Product Images
          Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(TSize.md),
        margin: const EdgeInsets.only(right: TSize.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
