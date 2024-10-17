import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../utils/constans/size.dart';
import '../../../utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

    final Widget? title;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final List<Widget>? actions;
    final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSize.xs),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? Padding(
                padding: const EdgeInsets.only(left: 0),
                child: IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left_copy), color: CustomHelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,),
              )
              : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
          title: title,
          actions: actions,
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
