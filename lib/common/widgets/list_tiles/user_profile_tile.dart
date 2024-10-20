import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../shimmers/shimmer.dart';
import '../images/t_circular_image.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.profile_picture;
        return controller.imageUploading.value
            ? const TShimmerEffect(width: 56, height: 56, radius: 56)
            : TCircularImage(image: image, width: 56, height: 56, padding: 0, isNetworkImage: networkImage.isNotEmpty);
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: () => Get.to(const ProfileScreen()),
       icon: const Icon(Iconsax.edit, color: TColors.white),),

    );
  }
}