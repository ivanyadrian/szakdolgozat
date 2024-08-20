import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/authentication/authentication_repository.dart';
import 'package:szakdolgozat_app/features/authentication/screens/password_operation/reset_password.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';

import '../../../../common/widgets/loaders/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Feldolgozás...', TImages.loadingAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }


      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email elküldve', message: 'A jelszó visszaállításához szükséges link elküldve'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    }
  }

    resendPasswordResetEmail(String email) async {
      try {
        // Start Loader
        TFullScreenLoader.openLoadingDialog('Feldolgozás...', TImages.loadingAnimation);

        // Check Internet Connection
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          // Remove Loader
          TFullScreenLoader.stopLoading();
          return;
        }

        // Send Email to Reset Password
        await AuthenticationRepository.instance.sendPasswordResetEmail(email);

        // Remove Loader
        TFullScreenLoader.stopLoading();

        // Show Success Screen
        TLoaders.successSnackBar(title: 'Email elküldve', message: 'A jelszó visszaállításához szükséges link elküldve'.tr);

      } catch (e) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
      }
    }
  }
