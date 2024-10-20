import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import 'package:szakdolgozat_app/utils/validators/validation.dart';

import '../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Név módosítása', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Használj valós nevet az egyszerűbb hitelesítés érdekében',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSize.spaceBetweenSections),

            /// Textfield and button
            Form(
              key: controller.updateNameFormKey,
              child: Column(
                children: [

                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validEmptyText('Vezetéknév', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),

                  const SizedBox(height: TSize.spaceBetweenInputFields),

                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validEmptyText('Keresztnév', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateName(),
                  child: const Text('Megerősítés')),
            )
          ],
        ),
      ),
    );
  }
}
