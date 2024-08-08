import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/styles/spacing_styles.dart';
import 'package:szakdolgozat_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:szakdolgozat_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constans/size.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [

                /// LOGO, TITILE AND SUBTITLE
                TLoginHeader(),

                /// FORM
                TLoginForm(),

                /// Divider
                TFormDivider(dividerText: TTexts.orSignInWith),
                SizedBox(height: TSize.spaceBetweenSections),

                /// Footer
                TGoogleButton()
              ],
            )),
      ),
    );
  }
}



