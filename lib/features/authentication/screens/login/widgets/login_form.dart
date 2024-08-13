import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/login/login_controller.dart';
import 'package:szakdolgozat_app/features/authentication/screens/signup/signup.dart';
import 'package:szakdolgozat_app/utils/validators/validation.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/constans/text_strings.dart';
import '../../password_operation/forgot_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final localStorage = GetStorage();

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSize.spaceBetweenSections),
        child: Column(
          children: [
            /// EMAIL
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: TTexts.email),
            ),

            const SizedBox(height: TSize.spaceBetweenInputFields),

            /// PASSWORD
            Obx(
              () => TextFormField(
                validator: (value) =>
                    TValidator.validEmptyText('Jelszó', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(height: TSize.spaceBetweenInputFields / 2),

            /// REMEMBER ME AND FORGET PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// REMEMBER ME
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = value!;
                          localStorage.write('remember_me', value);
                        },
                      ),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                ///FORGET PASSWORD
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),

            const SizedBox(height: TSize.spaceBetweenSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSize.spaceBetweenItems),

            /// Create Account
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
