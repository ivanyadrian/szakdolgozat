import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/authentication/authentication_repository.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';

import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../utils/constans/image_strings.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    rememberMe.value = localStorage.read('remember_me') ?? false;
    if (rememberMe.value) {
      email.text = localStorage.read('Emlékezz_rám_email') ?? '';
      password.text = localStorage.read('Emlékezz_rám_jelszó') ?? '';
    }
    super.onInit();
  }

  /// EMAIL ÉS JELSZÓ BEJELENTKEZÉS
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Bejelentkezés...', TImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!loginFormKey.currentState!.validate()) {
        // remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        // Mentsük az adatokat, ha a checkbox be van pipálva
        localStorage.write('Emlékezz_rám_email', email.text.trim());
        localStorage.write('Emlékezz_rám_jelszó', password.text.trim());
      } else {
        // Töröljük az adatokat, ha a checkbox nincs bepipálva
        localStorage.remove('Emlékezz_rám_email');
        localStorage.remove('Emlékezz_rám_jelszó');
      }

      // Login user using Email & Password Authentication
      //final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    }
  }
}