import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/constans/enums.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class TProductMetaData extends StatelessWidget {
  final String settlementName;
  final String countyName;

  const TProductMetaData({
    required this.settlementName,
    required this.countyName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Use Flexible to allow truncation
            Flexible(
              child: TBrandTitleWithVerifiedIcon(
                title: settlementName,
                brandTextSizes: TextSizes.small,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8.0), // Adjust the spacing if needed
            Flexible(
              child: TBrandTitleWithVerifiedIcon(
                title: countyName,
                brandTextSizes: TextSizes.small,
                maxLines: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems),
      ],
    );
  }
}
