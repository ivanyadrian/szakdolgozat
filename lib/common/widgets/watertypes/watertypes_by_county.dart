import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../utils/constans/colors.dart';
import '../../../utils/constans/enums.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/size.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../text/t_brand_title_text_with_verified_icon.dart';


class TWaterTypesByCounty extends StatelessWidget {
  const TWaterTypesByCounty({
    super.key,
    required this.showBorder,
    this.onTab,
    required this.title,
  });

  final bool showBorder;
  final void Function()? onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTab,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // ICON
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImages.budapest,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSize.spaceBetweenItems / 2),

            // TEXT
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: title,
                    brandTextSizes: TextSizes.large,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
