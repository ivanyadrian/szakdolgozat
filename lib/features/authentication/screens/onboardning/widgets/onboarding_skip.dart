import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSize.defaultSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text('Kihagyás')),
        );
  }
}