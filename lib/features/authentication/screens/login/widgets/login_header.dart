import 'package:flutter/material.dart';

import '../../../../../utils/constans/image_strings.dart';
import '../../../../../utils/constans/size.dart';
import '../../../../../utils/constans/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = CustomHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(child: Image(height: 150, image: AssetImage(dark ? TImages.lightLogo : TImages.darkLogo),)),

        Center(child: Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium)),

        const SizedBox(height: TSize.sm),

        Center(child: Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium)),

      ],
    );
  }
}
