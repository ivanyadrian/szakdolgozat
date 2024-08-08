import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/authentication/authentication_repository.dart';
import 'package:szakdolgozat_app/data/repositories/user/user_repository.dart';
import 'package:szakdolgozat_app/features/authentication/screens/signup/verify_email.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';

import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../data/repositories/user/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  void signup() async {
    try {


      // Start loading
      TFullScreenLoader.openLoadingDialog('Feldolgozás...', TImages.loadingAnimation);



      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }


      // Form Validation
      if(!signupFormKey.currentState!.validate()) {
        // remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }



      // Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());



      // Save Authentication user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid, /// a felkiáltójel teszi lehetővé, hogy nem lehet null
        firstName: firstName.text.trim(), /// a trim eltávolítja elöl és hátul lévő felesleges szóközöket
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);



      // Remove Loader
      TFullScreenLoader.stopLoading();



      // show success message
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'A fiókodat sikeresen létrehoztad. A folytatáshoz erősítsd meg az email címedet.');



      // move to verify email screen
      Get.to(() => const VerifyEmailScreen());



    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();



      // show more generic error to the user
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    }
  }
}
