import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/features/browsing/screens/upload_new_element/widgets/custom_image_list.dart';
import 'package:szakdolgozat_app/utils/validators/validation.dart';
import '../../../../../utils/constans/size.dart';
import '../../../controllers/fishingspot_controller.dart';
import 'custom_dropdown.dart';

class TNewFishingSpotForm extends StatelessWidget {
  final FishingSpotController controller = Get.put(FishingSpotController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.fishingSpotFormKey,
      child: Column(
        children: [
          /// Hely neve
          TextFormField(
            controller: controller.placeName,
            validator: (value) => TValidator.validEmptyText('Hely neve', value),
            decoration: const InputDecoration(
              labelText: 'Hely neve',
              prefixIcon: Icon(Iconsax.building),
            ),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields),

          /// Típusa (Dropdown)
          TCustomDropdown(
            labelText: 'Típusa',
            items: ['Tó', 'Folyó', 'Patak', 'Csatorna', 'Mocsár'],
            value: controller.waterType.text.isEmpty
                ? null
                : controller.waterType.text,
            onChanged: (value) => controller.waterType.text = value!,
            prefixIcon: const Icon(Icons.water),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields),

          /// Vármegye (Dropdown)
          TCustomDropdown(
            labelText: 'Vármegye',
            items: [
              'Budapest',
              'Bács-Kiskun',
              'Békés',
              'Borsod-Abaúj-Zemplén',
              'Csongrád-Csanád',
              'Fejér',
              'Győr-Moson-Sopron',
              'Hajdú-Bihar',
              'Heves',
              'Jász-Nagykun-Szolnok',
              'Komárom-Esztergom',
              'Nógrád',
              'Pest',
              'Somogy',
              'Szabolcs-Szatmár-Bereg',
              'Tolna',
              'Vas',
              'Veszprém',
              'Zala'
            ],
            value:
                controller.county.text.isEmpty ? null : controller.county.text,
            onChanged: (value) => controller.county.text = value!,
            prefixIcon: const Icon(Icons.map),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields),

          /// Stégek/Spotok száma
          TextFormField(
            controller: controller.numberOfSpots,
            validator: (value) => TValidator.validateNumber(value),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Horgászállások száma',
              prefixIcon: Icon(Icons.numbers),
            ),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields),

          /// GPS koordináta
          TextFormField(
            controller: controller.gpsCoordinates,
            validator: (value) =>
                TValidator.validateGpsCoordinate(value),
            decoration: const InputDecoration(
              labelText: 'GPS koordináta',
              prefixIcon: Icon(Iconsax.location),
            ),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields * 2),

          // Image picker
          Obx(() {
            final images = controller.selectedImages;
            return images.isEmpty
                ? const Text('Nincs kiválasztva kép')
                : Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (images.length > 0)
                  TRoundedImageInList(imageFile: File(images[0].path)),

                if (images.length > 1)
                  TRoundedImageInList(imageFile: File(images[1].path)),

                // Show the third image with overlay if there are more than 2 images
                if (images.length > 2)
                  Stack(
                    children: [
                      TRoundedImageInList(imageFile: File(images[2].path)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Beállítja a lekerekítés mértékét
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.black.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              '+${images.length - 2}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            );
          }),

          const SizedBox(height: TSize.spaceBetweenInputFields),

          OutlinedButton(
            onPressed: () => controller.pickImages(),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: const Text('Képek kiválasztása'),
            ),
          ),

          const SizedBox(height: TSize.spaceBetweenInputFields * 2),

          /// Mentés gomb
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.saveFishingSpot(),
              child: const Text('Mentés'),
            ),
          ),
        ],
      ),
    );
  }
}

