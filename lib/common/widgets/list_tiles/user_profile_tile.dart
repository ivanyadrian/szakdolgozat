import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constans/colors.dart';
import '../../../utils/constans/image_strings.dart';
import '../images/t_circular_image.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.profile_picture,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Felhasználó', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('felhasznalo@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: () => Get.to(const ProfileScreen()),
       icon: const Icon(Iconsax.edit, color: TColors.white),),

    );
  }
}