import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/login_signup/form_divider.dart';
import 'package:szakdolgozat_app/common/widgets/login_signup/social_button.dart';
import 'package:szakdolgozat_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            /// Title
            Text(TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSize.spaceBetweenInputFields),

            /// Form
            const TSignUpForm(),
            const SizedBox(height: TSize.spaceBetweenInputFields),

            /// DIVIDER
            const TFormDivider(dividerText: TTexts.orSignUpWith),
            const SizedBox(height: TSize.spaceBetweenInputFields * 2),

            /// GOOGLE LOGO
            const TGoogleButton(),
          ],
        ),
      )),
    );
  }
}


