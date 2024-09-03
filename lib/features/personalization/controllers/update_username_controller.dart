import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/user/user_repository.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';

import '../../../common/widgets/loaders/network_manager.dart';

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();

  final username = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Name Screen appears
  @override
  void onInit() {
    initializeUsernames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeUsernames() async {
    username.text = userController.user.value.username;
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

      // Firestore document reference
      final userDocRef = FirebaseFirestore.instance.collection('Users').doc(userController.user.value.id);

      // Update the phone number in Firestore
      await userDocRef.update({
        'username': username.text.trim(),
      });

      // Update the Rx User value
      userController.user.value.username = username.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success screen
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Sikeresen módosítottad a felhasználóneved', duration: 2);

      await Future.delayed(const Duration(seconds: 2));

      // Move to previous screen
      Get.back();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString(), duration: 2);
    }
  }
}