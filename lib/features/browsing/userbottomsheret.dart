import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/shimmers/shimmer.dart';
import '../../common/widgets/images/t_circular_image.dart';
import '../../common/widgets/loaders/loaders.dart';
import '../../data/repositories/user/user_model.dart';
import '../../data/repositories/user/user_repository.dart';
import '../../utils/constans/image_strings.dart';
import '../personalization/screens/profile/widgets/profile_menu.dart';


class UserDetailBottomSheet extends StatelessWidget {
  final String userId;

  const UserDetailBottomSheet({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: UserRepository().getUserById(userId),
      builder: (context, snapshot) {
        // If loading, show a placeholder without the profile picture
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // No profile picture displayed during loading
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Betöltés...',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: TShimmerEffect(width: double.infinity, height: 20)),
              ],
            ),
          );
        }

        final user = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: TCircularImage(
                    image: user.profilePicture.isNotEmpty ? user.profilePicture : TImages.placeholder,
                    width: 100,
                    height: 100,
                    isNetworkImage: user.profilePicture.isNotEmpty,
                    padding: 0,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  user.fullName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TProfileMenu(
                  title: 'Felhasználónév',
                  value: user.username,
                  icon: null,
                ),
                TProfileMenu(
                  title: 'E-mail',
                  value: user.email,
                  icon: Iconsax.copy_copy,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: user.email));
                    TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Az e-mail cím sikeresen másolva', duration: 2);
                  },
                ),
                TProfileMenu(
                  title: 'Telefonszám',
                  value: user.phoneNumber,
                  icon: Iconsax.copy_copy,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: user.phoneNumber));
                    TLoaders.successSnackBar(title: 'Nagyszerű', message: 'A telefonszám sikeresen másolva', duration: 2);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Function to show the bottom sheet
void showUserDetailBottomSheet(BuildContext context, String userId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => UserDetailBottomSheet(userId: userId),
  );
}





