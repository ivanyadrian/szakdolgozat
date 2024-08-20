import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/user/user_repository.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';

import '../../../common/widgets/loaders/network_manager.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Name Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Fiókhoz tartozó adatok frissítése...', TImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()) {
        // remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'Keresztnév': firstName.text.trim(), 'Vezetéknév': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();



      // Remove Loader
      TFullScreenLoader.stopLoading();


      // Show Success screen
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Sikeresen módosítottad a neved');

      await Future.delayed(const Duration(seconds: 3));

      // Move to previous screen
      Get.back();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    }
  }
}