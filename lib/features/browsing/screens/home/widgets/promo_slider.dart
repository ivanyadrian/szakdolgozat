import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/home_controller.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_containers.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constans/size.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            // Show a loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          } else if (controller.banners.isEmpty) {
            return Center(child: Text('Nincsenek elérhető képek'));
          } else {
            return CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map(
                    (url) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // állítsd be a kívánt vízszintes paddingot
                      child: TRoundedImage(
                        imageUrl: url,
                        isNetworkImage: true,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            );
          }
        }),
        const SizedBox(height: TSize.spaceBetweenItems),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              ? TColors.lightGreen
                              : TColors.grey,
                    ),
                ],
              )),
        ),
      ],
    );
  }
}
