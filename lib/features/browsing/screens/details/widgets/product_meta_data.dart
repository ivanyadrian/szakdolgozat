import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
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
            TBrandTitleWithVerifiedIcon(
              title: settlementName, // Use settlementName here
              brandTextSizes: TextSizes.small,
            ),
            TBrandTitleWithVerifiedIcon(
              title: countyName, // Use countyName here
              brandTextSizes: TextSizes.small,
            ),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems),
      ],
    );
  }
}
