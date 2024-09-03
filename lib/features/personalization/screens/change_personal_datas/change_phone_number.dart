import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import 'package:szakdolgozat_app/utils/validators/validation.dart';

import '../../controllers/update_user_phone_number_controller.dart';


class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());

    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Telefonszám módosítása', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Add meg az új telefonszámot',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSize.spaceBetweenSections),

            /// Textfield and button
            Form(
              key: controller.updatePhoneNumberFormKey,
              child: Column(
                children: [

                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => TValidator.validatePhoneNumber(value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.phoneNumber,
                        prefixIcon: Icon(Icons.phone)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updatePhoneNumber(),
                  child: const Text('Megerősítés')),
            )
          ],
        ),
      ),
    );
  }
}
