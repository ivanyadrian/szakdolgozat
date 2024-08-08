import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/browsing/screens/favourite/favourite.dart';
import 'package:szakdolgozat_app/features/browsing/screens/home/home.dart';
import 'package:szakdolgozat_app/features/browsing/screens/search/search.dart';
import 'package:szakdolgozat_app/features/personalization/screens/settings/settings.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(

      /// NAVIGATION
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) => navigationController.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),

          /// NAVBAR ELEMENTS
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Főképernyő"),
            NavigationDestination(icon: Icon(Icons.search), label: "Keresés"),
            NavigationDestination(icon: Icon(Icons.star), label: "Kedvencek"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Fiók"),
          ],
        ),
      ),
      body: Obx(() => navigationController.screens[navigationController.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  /// SCREENS
  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
