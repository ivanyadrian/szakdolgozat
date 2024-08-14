import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../../../utils/constans/size.dart';

class TGoogleButton extends StatelessWidget {
  const TGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                width: TSize.iconMd,
                height: TSize.iconMd,
                image: AssetImage(TImages.googleLogo),
              )
          ),
        )
      ],
    );
  }
}
