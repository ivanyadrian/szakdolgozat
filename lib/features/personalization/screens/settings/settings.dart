import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:szakdolgozat_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/data/repositories/authentication/authentication_repository.dart';
import 'package:szakdolgozat_app/features/browsing/screens/upload_new_element/upload_new_element.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constans/text_strings.dart';
import 'empty.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// HEADER
                  TPrimaryHeaderContainer(
                    child: Column(
                      children: [
                        TAppBar(
                          title: Text(
                            'Fiók',
                            style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                          ),
                        ),

                        /// KÉP - NÉV - EMAIL - MÓDOSÍTÓ GOMB SZEGMENS
                        const TUserProfileTile(),
                        const SizedBox(height: TSize.spaceBetweenSections),
                      ],
                    ),
                  ),

                  /// BODY
                  Padding(
                    padding: const EdgeInsets.all(TSize.defaultSpace),
                    child: Column(
                      children: [

                        TSettingsMenuTitle(
                          icon: Icons.upload,
                          title: 'Hozzáadás',
                          subTitle:
                          'Itt adhatsz hozzá új horgászhelyet. A szükséges adatok megadását követően a feltöltött hely megjelenik a "Keresés" képernyőn.',
                          onTap: () => Get.to(() => const AddNewElement()),
                        ),
                        const SizedBox(height: TSize.spaceBetweenItems),
                        const Divider(),


                        TSettingsMenuTitle(
                          icon: Iconsax.cup,
                          title: 'Büszkeség',
                          subTitle:
                          'Ha büszke vagy a kifogott halra, töltsd fel ide és a kép megjelenhet a főképernyőn.',
                          onTap: () => Get.to(() => EmptyScreen()),
                        ),
                        const SizedBox(height: TSize.spaceBetweenSections),


                        const SizedBox(height: TSize.spaceBetweenItems * 4),
                        const TSectionHeading(title: 'Alkalmazás beállításai', showActionButton: false),
                        const SizedBox(height: TSize.spaceBetweenItems),


                        TSettingsMenuTitle(
                          icon: Icons.notifications,
                          title: 'Értesítések',
                          subTitle: 'Kapj értesítést a fontos eseményekről.',
                          trailing: Switch(value: true, onChanged: (value) {
                          }),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// SIGN OUT BUTTON
          Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: CustomHelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                  ), // Keret színe
                ),
                child: const Text(TTexts.signOut),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


