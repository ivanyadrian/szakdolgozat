import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../utils/constans/image_strings.dart';
import '../../../../utils/constans/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [

                  Image(image: const AssetImage(TImages.emailSent), width: CustomHelperFunctions.screenWidth() * 0.6),
                  const SizedBox(height: TSize.spaceBetweenSections),

                  /// TITLE AND SUBTITLE
                  Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                  const SizedBox(height: TSize.spaceBetweenItems),
                  Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                  const SizedBox(height: TSize.spaceBetweenItems),
                  Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                  const SizedBox(height: TSize.spaceBetweenSections),

                  /// BUTTON
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(TTexts.verifycontinue)),
                  ),
                  const SizedBox(height: TSize.spaceBetweenItems),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail)),
                  )
                ],
              )),
        ));
  }
}
