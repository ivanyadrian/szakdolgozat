import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/constans/enums.dart';

import '../../../../../utils/constans/size.dart';


class TRatingAndShare extends StatelessWidget {
  final String placeName; // Add placeName as a parameter

  const TRatingAndShare({required this.placeName, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              placeName, // Use the placeName here
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star, color: Colors.amber, size: 24),
            const SizedBox(width: TSize.spaceBetweenItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: ' (375)'),
                ],
              ),
            ),
            /// Share Button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, size: TSize.iconMd),
            ),
          ],
        ),
      ],
    );
  }
}

