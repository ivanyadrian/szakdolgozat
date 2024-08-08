import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/bindings/general_bindings.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/theme/tehem.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// ANNAK JELÖLÉSE, HOGY A KÉPERNYŐ TÖLTŐDIK
      home: const Scaffold(backgroundColor: TColors.primaryColor, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}