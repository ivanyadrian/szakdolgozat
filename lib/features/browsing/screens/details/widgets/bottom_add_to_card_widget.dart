import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constans/size.dart';

import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../../../utils/constans/size.dart';
import 'package:flutter/services.dart';

import '../../../map_screen.dart'; // Import for clipboard functionality

class TOpenMapButton extends StatelessWidget {
  final String gpsCoordinates;

  const TOpenMapButton({required this.gpsCoordinates, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusLg),
          topRight: Radius.circular(TSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // Smaller button to copy GPS coordinates
          ElevatedButton(
            onPressed: () {
              // Logic to copy the coordinates to the clipboard
              Clipboard.setData(ClipboardData(text: gpsCoordinates)).then((_) {
                // Optionally show a snackbar or a toast message to confirm copy
                ScaffoldMessenger.of(context).showSnackBar(
                  TLoaders.customToast(message: 'A GPS koordináták sikeresen kimásolva'),
                );
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: TSize.sm, horizontal: TSize.defaultSpace),
              backgroundColor: dark ? TColors.black : TColors.lightGrey, // Lighter background for distinction
              side: const BorderSide(color: TColors.black),
            ),
            child: SizedBox(
              width: 80, // Limit width to encourage line break
              child: Text(
                'Koordináta másolása',
                textAlign: TextAlign.center, // Center the text
                maxLines: 2, // Allow two lines
                softWrap: true, // Enable soft wrapping
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),


          // Button to open the map
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapScreen(gpsCoordinates: gpsCoordinates),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSize.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Térkép megnyitása'),
          ),
        ],
      ),
    );
  }
}


