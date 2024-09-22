import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/icons/t_circular_icon.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:szakdolgozat_app/features/browsing/screens/home/home.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Kedvencek', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const Column())
            ],
          ),
        ),
      ),
    );
  }
}
