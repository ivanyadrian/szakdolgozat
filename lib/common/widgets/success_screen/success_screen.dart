import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/styles/spacing_styles.dart';

import '../../../utils/constans/size.dart';
import '../../../utils/constans/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image), width: CustomHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// TITLE AND SUBTITLE
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// BUTTON
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.verifycontinue))),

            ],
          ),
        ),
      ),
    );
  }
}
