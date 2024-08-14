import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:szakdolgozat_app/features/authentication/screens/password_operation/reset_password.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import 'package:szakdolgozat_app/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: TAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(TTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: TSize.spaceBetweenItems),
            Center(
                child: Text(TTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium)),
            const SizedBox(height: TSize.spaceBetweenSections * 2),

            Form(
              key: controller.forgetPasswordFormKey,

              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenSections),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(TTexts.sendLink))),
          ],
        ),
      ),
    );
  }
}
