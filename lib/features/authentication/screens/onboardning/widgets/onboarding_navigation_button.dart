import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNavigationButton extends StatelessWidget {
  const OnBoardingNavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = CustomHelperFunctions.isDarkMode(context);

    return Positioned(
        right: TSize.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(backgroundColor: dark ? TColors.primaryColor: Colors.black),
          child: const Icon(Iconsax.arrow_right_2),
        )
    );
  }
}