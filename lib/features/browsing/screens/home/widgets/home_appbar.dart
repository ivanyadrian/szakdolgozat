import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/styles/shimmer.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.grey),
          ),

          Obx(
            () {
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being loaded
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),

      /*
      actions: [
        TCartCountericon(onPressed: () {}, iconColor: TColors.white)
      ],
      */
    );
  }
}
