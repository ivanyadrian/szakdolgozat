import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../controllers/fishingspot_controller.dart';
import '../upload_new_element/model/fishing_spot_model.dart';

class BrandProducts extends StatelessWidget {
  final String countyName;
  final String waterType; // Új paraméter a víztípushoz

  const BrandProducts({super.key, required this.countyName, required this.waterType}); // Víztípus átadása

  @override
  Widget build(BuildContext context) {
    final FishingSpotController controller = FishingSpotController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text('$countyName - $waterType'), showBackArrow: true), // Megye és víztípus megjelenítése
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: FutureBuilder<List<FishingSpotModel>>(
            future: controller.getFishingSpotsByCountyAndWaterType(countyName, waterType),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Hiba: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nincs elérhető horgászhely.'));
              }

              final fishingSpots = snapshot.data!;

              return TGridLayout(
                itemCount: fishingSpots.length,
                itemBuilder: (_, index) {
                  final spot = fishingSpots[index];

                  return TProductCardVertical(
                    imageUrl: spot.imageUrls.isNotEmpty ? spot.imageUrls.first : '',
                    placeName: spot.placeName,
                    waterType: spot.waterType,
                    countyName: countyName,
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


