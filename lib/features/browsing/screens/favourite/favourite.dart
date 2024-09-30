import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/favourite_controller.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../upload_new_element/model/fishing_spot_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Kedvencek',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: FutureBuilder<List<FishingSpotModel>>(
            future: controller.favouriteProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Hiba történt: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nincsenek kedvencek'));
              }

              final products = snapshot.data!;

              return TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final spot = products[index];

                  return TProductCardVertical(
                    imageUrl: spot.imageUrls.isNotEmpty ? spot.imageUrls.first : '',
                    placeName: spot.placeName,
                    waterType: spot.waterType,
                    countyName: spot.countyName,
                    settlementName: spot.settlementName,
                    fishingSpot: spot,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}



