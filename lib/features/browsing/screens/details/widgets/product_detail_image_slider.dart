import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/image_strings.dart';
import '../../../../../utils/constans/size.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [

            /// MAIN LARGE IMAGE
            /*
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(TImages.cardImage1))),
              ),
            ),
            */
            const Center(
                child: Image(image: AssetImage(TImages.cardImage1))),

            /// IMAGE SLIDER
            Positioned(
              right: 0,
              bottom: 30,
              left: TSize.defaultSpace,

              child: SizedBox(
                height: 80,

                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSize.spaceBetweenItems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primaryColor),
                    padding: const EdgeInsets.all(TSize.sm),
                    imageUrl: TImages.cardImage1,
                  ),
                ),
              ),
            ),

            /// APPBAR
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}