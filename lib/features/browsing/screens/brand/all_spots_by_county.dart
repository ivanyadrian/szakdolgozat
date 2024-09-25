import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../controllers/fishingspot_controller.dart';
import '../upload_new_element/model/fishing_spot_model.dart';

class CountyFishingSpotsScreen extends StatelessWidget {
  final String countyName; // A megye neve, amit megkap a widget

  const CountyFishingSpotsScreen({super.key, required this.countyName});

  @override
  Widget build(BuildContext context) {
    final FishingSpotController controller = FishingSpotController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text('Horgászhelyek - $countyName'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: FutureBuilder<List<FishingSpotModel>>(
            future: controller.getFishingSpotsByCounty(countyName), // Csak a megyére szűrünk
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator()); // Betöltés közbeni indikátor
              }

              if (snapshot.hasError) {
                return Center(child: Text('Hiba: ${snapshot.error}')); // Hiba esetén hibaüzenet
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nincs elérhető horgászhely.')); // Ha nincs adat
              }

              final fishingSpots = snapshot.data!; // Az összes hely az adott megyéből

              return TGridLayout(
                itemCount: fishingSpots.length,
                itemBuilder: (_, index) {
                  final spot = fishingSpots[index]; // Egy adott horgászhely

                  return TProductCardVertical(
                    imageUrl: spot.imageUrls.isNotEmpty ? spot.imageUrls.first : '',
                    placeName: spot.placeName,
                    waterType: spot.waterType,
                    countyName: spot.countyName, // Használjuk a FishingSpotModel-ból
                    settlementName: spot.settlementName,
                    fishingSpot: spot, // A horgászhely objektuma
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
