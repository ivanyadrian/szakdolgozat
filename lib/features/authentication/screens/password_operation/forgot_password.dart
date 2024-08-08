import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/authentication/screens/password_operation/reset_password.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: TSize.spaceBetweenSections),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const ResetPassword()),
                        child: const Text(TTexts.sendLink))),
              ],
            )));
  }
}
