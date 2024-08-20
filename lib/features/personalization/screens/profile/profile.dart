import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/styles/shimmer.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/images/t_circular_image.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';
import 'package:szakdolgozat_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../utils/constans/image_strings.dart';
import '../change_personal_Datas/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Fiók'),
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [

                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.profile_picture;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(image: image, width: 80, height: 80, padding: 0, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Profilkép módosítása'))
                  ],
                ),
              ),

              /// DETAILS
              const SizedBox(height: TSize.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: TSize.spaceBetweenItems),

              /// PROFIL INFORMATIONS
              const TSectionHeading(title: 'Profilhoz tartozó információk', showActionButton: false),
              const SizedBox(height: TSize.spaceBetweenItems * 2),

              TProfileMenu(title: 'Név', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(title: 'Felhasználónév', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: TSize.spaceBetweenItems * 4),
              const Divider(),
              const SizedBox(height: TSize.spaceBetweenItems),

              /// USER INFORMATIONS
              const TSectionHeading(title: 'Felhasználó személyes információi', showActionButton: false),
              const SizedBox(height: TSize.spaceBetweenItems * 2),

              TProfileMenu(title: 'Felhasználó ID', value: controller.user.value.id, icon: Iconsax.copy_copy, onPressed: () {}),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              TProfileMenu(title: 'Telefonszám', value: controller.user.value.phoneNumber, onPressed: () {}),
              TProfileMenu(title: 'Nem', value: 'felhasználó neme', onPressed: () {}),
              TProfileMenu(title: 'Születési dátum', value: 'felhasználó születési dátuma', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSize.spaceBetweenItems * 4),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Fiók törlése', style: TextStyle(color: Colors.red, fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
