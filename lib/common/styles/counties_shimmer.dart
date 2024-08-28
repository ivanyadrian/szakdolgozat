import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/styles/shimmer.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class TCountiesShimmer extends StatelessWidget {
  const TCountiesShimmer({
    super.key,
    this.itemCount = 19,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: TSize.spaceBetweenItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSize.spaceBetweenItems / 2),

              /// Text
              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
