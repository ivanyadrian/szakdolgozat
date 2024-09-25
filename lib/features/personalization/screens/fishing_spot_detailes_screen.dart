import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../browsing/screens/upload_new_element/model/fishing_spot_model.dart';

class FishingSpotDetailScreen extends StatelessWidget {
  final FishingSpotModel fishingSpot;

  const FishingSpotDetailScreen({required this.fishingSpot, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(title: Text(fishingSpot.placeName), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying all images
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: fishingSpot.imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(fishingSpot.imageUrls[index], fit: BoxFit.cover);
                },
              ),
            ),
            SizedBox(height: 16),
            Text('Place Name: ${fishingSpot.placeName}', style: Theme.of(context).textTheme.headlineMedium),
            Text('Water Type: ${fishingSpot.waterType}', style: Theme.of(context).textTheme.bodyMedium),
            Text('County: ${fishingSpot.countyName}', style: Theme.of(context).textTheme.bodyMedium),
            Text('Settlement Name: ${fishingSpot.settlementName}', style: Theme.of(context).textTheme.bodyMedium),
            Text('Uploaded By: ${fishingSpot.uploadedBy}', style: Theme.of(context).textTheme.bodyMedium),
            Text('GPS Coordinate: ${fishingSpot.gpsCoordinates}', style: Theme.of(context).textTheme.bodyMedium),
            Text('Number of spots: ${fishingSpot.numberOfSpots}', style: Theme.of(context).textTheme.bodyMedium),
            Text('Description: ${fishingSpot.description}', style: Theme.of(context).textTheme.bodyMedium),


            SizedBox(height: 16),
            // Additional details can be added here
          ],
        ),
      ),
    );
  }
}
