import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import '../fishing_spot_detailes_screen.dart';


class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  Future<List<FishingSpotModel>> _fetchFishingSpots() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('FishingSpots')
          .get();

      return snapshot.docs.map((doc) => FishingSpotModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception('Failed to load fishing spots: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Tesztelés'),
      ),
      body: FutureBuilder<List<FishingSpotModel>>(
        future: _fetchFishingSpots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hiba történt: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nincsenek horgászhelyek'));
          } else {
            final fishingSpots = snapshot.data!;
            return ListView.builder(
              itemCount: fishingSpots.length,
              itemBuilder: (context, index) {
                final spot = fishingSpots[index];
                return ListTile(
                  leading: spot.imageUrls.isNotEmpty
                      ? Image.network(spot.imageUrls.first, width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.photo, size: 50),
                  title: Text(spot.placeName),
                  subtitle: Text('Víztípus: ${spot.waterType}, Megye: ${spot.countyId}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FishingSpotDetailScreen(fishingSpot: spot),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}




