import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 3) {

      final storage = GetStorage();
      if (kDebugMode) {
        print('==================== GET STORAGE  NEXT BUTTON===============');
        print(storage.read('isFirstTime'));
      }

      storage.write('isFirstTime', false);

      if (kDebugMode) {
        print('==================== GET STORAGE  NEXT BUTTON===============');
        print(storage.read('isFirstTime'));
      }

      Get.offAll(const LoginScreen());

    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.ease).then((_) {
        currentPageIndex.value = page;
      });
    }
  }

  void skipPage() {
    Get.offAll(const LoginScreen());
  }
}
