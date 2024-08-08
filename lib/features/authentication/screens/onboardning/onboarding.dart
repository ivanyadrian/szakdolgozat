import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:szakdolgozat_app/features/authentication/screens/onboardning/widgets/onboarding_dot_navigation.dart';
import 'package:szakdolgozat_app/features/authentication/screens/onboardning/widgets/onboarding_navigation_button.dart';
import 'package:szakdolgozat_app/features/authentication/screens/onboardning/widgets/onboarding_page.dart';
import 'package:szakdolgozat_app/features/authentication/screens/onboardning/widgets/onboarding_skip.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //HORIZONTAL PAGES
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.updatePageIndicator(index);
            },
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage4,
                title: TTexts.onBoardingTitle4,
                subTitle: TTexts.onBoardingSubTitle4,
              ),
            ],
          ),

          //SKIP
          const OnBoardingSkip(),

          //PAGE MARKER
          const OnBoardDotNavigation(),

          //NEXT PAGE BUTTON
          const OnBoardingNavigationButton(),
        ],
      ),
    );
  }
}








