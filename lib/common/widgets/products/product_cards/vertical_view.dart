import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/images/rounded_image.dart';
import 'package:szakdolgozat_app/common/widgets/text/product_title_text.dart';
import 'package:szakdolgozat_app/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/size.dart';

class TVerticalView extends StatelessWidget {
  const TVerticalView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.onPressed,
  });

  final String image;
  final String text1;
  final String text2;
  final String text3;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          /// THUMBNAIL
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl: image, fit: BoxFit.cover),
                ),
              ],
            ),
          ),

          /// DETAILS
          Expanded(
            child: SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: text1, smallSize: true),
                        SizedBox(height: TSize.spaceBetweenItems / 2),
                        TBrandTitleWithVerifiedIcon(title: text2),
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            text3,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        /// Button
                        Container(
                          decoration: BoxDecoration(
                            color: dark ? TColors.dark : TColors.grey,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(TSize.cardRadiusMd),
                              bottomRight: Radius.circular(TSize.productImageRadius),
                            ),
                          ),
                          child: InkWell(
                            onTap: onPressed,
                            child: SizedBox(
                              width: TSize.iconLg * 1.2,
                              height: TSize.iconLg * 1.2,
                              child: Center(
                                child: Icon(
                                  Iconsax.arrow_right_3_copy,
                                  color: dark ? TColors.white : TColors.dark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
