import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.profile_picture)),
                const SizedBox(width: TSize.spaceBetweenItems),
                Text('Lakatos Vin Diesel', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSize.spaceBetweenItems),

        /// REVIEW
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSize.spaceBetweenItems),
            Text('2023.04.11', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: TSize.spaceBetweenItems),
        const ReadMoreText(
          'Nagyon fasza app. Rövid idő alatt megtaláltam a számomra tökéletes horgászhelyet. Az egyedüli problémám, az a horgászhelyen belüli spot kiválasztása.',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: '  Kevesebb',
          trimCollapsedText: '  Több',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
        ),
        const SizedBox(width: TSize.spaceBetweenItems),

        /// Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fejlesztő', style: Theme.of(context).textTheme.titleMedium),
                    Text('2023.04.17', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(width: TSize.spaceBetweenItems),
                const ReadMoreText(
                  'Köszöjük a visszajelzést. Igyekszünk a kedvében járni a design módosításával.',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: '  Kevesebb',
                  trimCollapsedText: '  Több',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSize.spaceBetweenSections),
      ],
    );

  }
}
