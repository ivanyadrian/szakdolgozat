import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/images/t_circular_image.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../utils/constans/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Fiók'),
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
                      const TCircularImage(image: TImages.profile_picture, width: 80, height: 80, padding: 0,),
                      TextButton(onPressed: (){}, child: const Text('Profilkép módosítása'))
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

                TProfileMenu(title: 'Név', value: 'felhasználó neve', onPressed: () {}),
                TProfileMenu(title: 'Felhasználónév', value: 'felhasználó felhasználóneve', onPressed: () {}),

                const SizedBox(height: TSize.spaceBetweenItems * 4),
                const Divider(),
                const SizedBox(height: TSize.spaceBetweenItems),


                /// USER INFORMATIONS
                const TSectionHeading(title: 'Felhasználó személyes információi', showActionButton: false),
                const SizedBox(height: TSize.spaceBetweenItems * 2),

                TProfileMenu(title: 'Felhasználó ID', value: 'felhasználó azonosítója', icon: Iconsax.copy_copy, onPressed: () {}),
                TProfileMenu(title: 'E-mail', value: 'felhasználó e-mail címe', onPressed: () {}),
                TProfileMenu(title: 'Telefonszám', value: 'felhasználó telefonszáma', onPressed: () {}),
                TProfileMenu(title: 'Nem', value: 'felhasználó neme', onPressed: () {}),
                TProfileMenu(title: 'Születési dátum', value: 'felhasználó születési dátuma', onPressed: () {}),
                const Divider(),
                const SizedBox(height: TSize.spaceBetweenItems * 4),

                Center(
                  child: TextButton(
                    onPressed: () {},
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
