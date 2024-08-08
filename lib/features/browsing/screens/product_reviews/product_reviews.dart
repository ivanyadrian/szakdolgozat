import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:szakdolgozat_app/features/browsing/screens/product_reviews/widgets/user_reviews_card.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APPBAR
      appBar: const TAppBar(title: Text('Vélemények | Értékelések'), showBackArrow: true),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Az értékelések és hozzászólások olyan személyektől származnak, akik olyan telefont használnak mint ön'),
                const SizedBox(height: TSize.spaceBetweenItems),

                /// Overall Product Ratings
                const TOverallProductRating(),
                const TRatingBarIndicator(rating: 3.4),
                Text('12,611', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: TSize.spaceBetweenSections),

                /// USER REVIEWS LIST
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
              ],
            ),
        ),
      ),
    );
  }
}


