import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../utils/constans/size.dart';


class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star, color: Colors.amber, size: 24),
            const SizedBox(width: TSize.spaceBetweenItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: ' (375)'),
                ],
              ),
            ),
          ],
        ),

        /// Share Button
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: TSize.iconMd),
        ),
      ],
    );
  }
}

