import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/constans/enums.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {

    //final dark = THelperFunctions.isDarkMode(context);

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TBrandTitleWithVerifiedIcon(title: 'Tokaj', brandTextSizes: TextSizes.small),
            TBrandTitleWithVerifiedIcon(title: 'Borsod-Abaúj-Zemplén', brandTextSizes: TextSizes.small),

          ],
        ),
        SizedBox(height: TSize.spaceBetweenItems),
      ],
    );
  }
}
