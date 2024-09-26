import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/images/t_circular_image.dart';
import 'package:szakdolgozat_app/utils/constans/enums.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';

import '../../common/widgets/loaders/loaders.dart';
import '../../data/repositories/user/user_model.dart';
import '../../data/repositories/user/user_repository.dart';
import '../../utils/constans/size.dart';
import '../personalization/screens/profile/widgets/profile_menu.dart';

class UserDetailScreen extends StatelessWidget {
  final String userId; // User ID passed from the previous screen

  const UserDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   TAppBar(title: Text('Felhasználó adatai'), showBackArrow: true),
      body: FutureBuilder<UserModel>(
        future: UserRepository().getUserById(userId), // Lekérés a UserRepository-ból
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hiba történt: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Felhasználó nem található.'));
          }

          final user = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (user.profilePicture.isNotEmpty)
                  Center(
                    child: TCircularImage(
                      image: user.profilePicture,
                      width: 100,
                      height: 100,
                      isNetworkImage: true,
                      padding: 0,
                    ),
                  )
                else Center(
                  child: TCircularImage(
                    image: TImages.placeholder,
                    width: 100,
                    height: 100,
                    isNetworkImage: false,
                    padding: 0,
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                SizedBox(height: TSize.spaceBetweenSections),
                TProfileMenu(title: 'Név', value: user.username, icon: null),
                TProfileMenu(title: 'E-mail', value: user.email, icon: Iconsax.copy_copy, onPressed: () {
                  Clipboard.setData(ClipboardData(text: user.email));
                  TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Az e-mail cím sikeresen másolva', duration: 2);
                },
                ),
                TProfileMenu(title: 'Telefonszám', value: user.phoneNumber, icon: Iconsax.copy_copy, onPressed: () {
                  Clipboard.setData(ClipboardData(text: user.phoneNumber));
                  TLoaders.successSnackBar(title: 'Nagyszerű', message: 'A telefonszám sikeresen másolva', duration: 2);
                },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}