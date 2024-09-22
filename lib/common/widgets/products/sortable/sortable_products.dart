import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../data/repositories/fishing_spots/fishing_spot_repository.dart';
import '../../../../features/browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import '../../../../utils/constans/size.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DROPDOWN
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          onChanged: (value) {},
          items: ['Név', 'Értékelés', 'Típus']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSize.spaceBetweenSections),

        /// PRODUCTS
        FutureBuilder<List<FishingSpotModel>>(
          future: _fetchFishingSpots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Hiba: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Nincs elérhető horgászhely.'));
            }

            final fishingSpots = snapshot.data!;

            return FutureBuilder<Map<String, String>>(
              future: _fetchCountyNames(fishingSpots),
              builder: (context, countySnapshot) {
                if (countySnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (countySnapshot.hasError) {
                  return Center(child: Text('Hiba: ${countySnapshot.error}'));
                }

                if (!countySnapshot.hasData || countySnapshot.data!.isEmpty) {
                  return Center(child: Text('Nem található megye.'));
                }

                final countyNames = countySnapshot.data!;

                return TGridLayout(
                  itemCount: fishingSpots.length,
                  itemBuilder: (_, index) {
                    final spot = fishingSpots[index];
                    final countyName = countyNames[spot.countyId] ?? 'Ismeretlen';

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
            );
          },
        ),
      ],
    );
  }

  Future<List<FishingSpotModel>> _fetchFishingSpots() async {
    // Replace this with actual data fetching logic
    final snapshot = await FirebaseFirestore.instance.collection('FishingSpots').get();
    return snapshot.docs.map((doc) => FishingSpotModel.fromSnapshot(doc)).toList();
  }

  Future<Map<String, String>> _fetchCountyNames(List<FishingSpotModel> fishingSpots) async {
    final countyIds = fishingSpots.map((spot) => spot.countyId).toSet();
    final countyNames = <String, String>{};

    for (var countyId in countyIds) {
      final name = await FishingSpotRepository.instance.getCountyNameById(countyId);
      countyNames[countyId] = name;
    }

    return countyNames;
  }
}
