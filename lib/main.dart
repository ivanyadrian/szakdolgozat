import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:szakdolgozat_app/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {

  // Todo: Add Widgets Binding
  /// Add Widgets Binding EZZEL TOVÁBB VITT AZ ONBORADNING SCREENRE, DE NEM TUDOM MIÉRT KELL IDE
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init Local Storage
  /// GetX Local Storage EZT SE TUDOM PONTOSAN MIT CSINÁL MÉG
  await GetStorage.init();

  // Todo: Await Native Splash
  /// SPLASH SCREEN AMÍG TÖLTŐDNEK AZ ADATOK
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // Todo: Initialize Firebase & Authentication
  /// Initialize Firebase & authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}

