import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/upload_new_element/widgets/new_fishing_spot_form.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class AddNewElement extends StatelessWidget {
  const AddNewElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
                /// Title
                Text('Hozzáadás',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSize.spaceBetweenInputFields * 2),

                /// Form
                TNewFishingSpotForm(),
              ],
            ),
          )),
    );
  }
}


