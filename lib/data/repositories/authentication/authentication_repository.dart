import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:szakdolgozat_app/features/authentication/screens/onboardning/onboarding.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function a releváns screenhez
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);

    // Annak ellenőrzése, hogy elsőnek indította-e el a felhasználó az appot
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }
  /* ---------------------------- Email & Password sign-in ----------- */

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }
  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailAuthentication] - Mail Verification

  /// [EmailAuthentication] - Forget Password

  /* ---------------------------- Social sign-in ----------- */

  /// [GoogleAuthentication] - Google

  /* ---------------------------- ./end Social sign-in ----------- */

  /// [LogoutUser] - Valid for any authentication

  /// DELETE USER - Remove user Auth and Firestore Account
}