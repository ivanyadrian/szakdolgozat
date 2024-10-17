import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/data/repositories/authentication/authentication_repository.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(image: const AssetImage(TImages.emailSent), width: CustomHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// TITLE AND SUBTITLE
              Text(TTexts.confirmEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(), /// EZ BACKEND MIATT
                  child: const Text(TTexts.verifycontinue),
                ),
              ),


              const SizedBox(height: TSize.spaceBetweenItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(TTexts.resendEmail))),



            ],
          ),
        ),
      ),
    );
  }
}
