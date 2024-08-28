import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import '../../../../../utils/constans/colors.dart';

class TInfoWidget extends StatelessWidget {
  final String information;
  final String livePlace;
  final List<String> season;
  final String feedingType;

  TInfoWidget({
    required this.information,
    required this.livePlace,
    required this.season,
    required this.feedingType,
  });

  @override
  Widget build(BuildContext context) {
    // Define the color and icon for the feedingType
    Color feedingTypeColor;
    switch (feedingType.toLowerCase()) {
      case 'ragadozó':
        feedingTypeColor = Colors.red;
        break;
      case 'mindenevő':
        feedingTypeColor = Colors.purple;
        break;
      case 'növényi':
        feedingTypeColor = Colors.lightGreen;
        break;
      default:
        feedingTypeColor = Colors.blueGrey;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ReadMoreText(
          information,
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimExpandedText: '  Kevesebb',
          trimCollapsedText: '  Több',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 14.0,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: TSize.defaultSpace),

        Text(
          'Élőhelye:',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 15.0,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: TSize.spaceBetweenItems / 2),

        // Design the livePlace text
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            livePlace,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: TSize.defaultSpace),

        Text(
          'Mikor a legaktívabb?',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 15.0,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: TSize.spaceBetweenItems),

        // Seasons and feedingType cards
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Seasons cards
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...season.take(2).map((season) {
                  Color cardColor;
                  IconData seasonIcon;

                  switch (season.toLowerCase()) {
                    case 'tavasz':
                      cardColor = Colors.green;
                      seasonIcon = Icons.local_florist; // Spring icon
                      break;
                    case 'nyár':
                      cardColor = Colors.lightBlueAccent;
                      seasonIcon = Icons.wb_sunny; // Summer icon
                      break;
                    case 'ősz':
                      cardColor = Colors.orange;
                      seasonIcon = Icons.park; // Autumn icon
                      break;
                    case 'tél':
                      cardColor = Colors.grey;
                      seasonIcon = Icons.ac_unit; // Winter icon
                      break;
                    default:
                      cardColor = Colors.blueGrey;
                      seasonIcon = Icons.help_outline; // Default icon
                  }

                  return Container(
                    color: cardColor,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(seasonIcon, color: Colors.white), // Icon with white color
                        SizedBox(width: 4), // Spacing between icon and text
                        Text(
                          season,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), // Text with white color
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8), // Padding for the container
                  );
                }).toList(),
              ],
            ),

            // FeedingType card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: feedingTypeColor, // Background color of the card
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  feedingType,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
