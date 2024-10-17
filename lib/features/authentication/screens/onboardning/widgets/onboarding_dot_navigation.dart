import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardDotNavigation extends StatelessWidget {
  const OnBoardDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() +20,
      left: TSize.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 4,
        effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light: TColors.dark, dotHeight: 6),
      )
    );
  }
}