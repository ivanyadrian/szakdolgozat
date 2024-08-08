import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/authentication/screens/signup/signup.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/constans/text_strings.dart';
import '../../password_operation/forgot_password.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSize.spaceBetweenSections),
        child: Column(
          children: [

            /// EMAIL
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: TTexts.email),
            ),

            const SizedBox(height: TSize.spaceBetweenInputFields),

            /// PASSWORD
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),

            const SizedBox(height: TSize.spaceBetweenInputFields / 2),

            /// REMEMBER ME AND FORGET PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// REMEMBER ME
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                ///FORGET PASSWORD
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword)
                ),
              ],
            ),

            const SizedBox(height: TSize.spaceBetweenSections),

            /// Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(TTexts.signIn))),
            const SizedBox(height: TSize.spaceBetweenItems),

            /// Create Account
            SizedBox(width: double.infinity,
                child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount))),

          ],
        ),
      ),
    );
  }
}
