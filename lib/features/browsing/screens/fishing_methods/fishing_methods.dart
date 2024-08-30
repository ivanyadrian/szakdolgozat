import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/fishes_layout.dart';
import 'package:szakdolgozat_app/features/browsing/screens/fishing_methods/models/fishing_methods_models.dart';
import 'package:szakdolgozat_app/features/browsing/screens/fishing_methods/widgets/fishing_methods_cards.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';
import '../../../../utils/constans/image_strings.dart';

class TFishingMethods extends StatelessWidget {
  const TFishingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of fish types
    final List<FishingMethodsModels> fishingMethods = [
      FishingMethodsModels(name: 'fenekező horgászat', imageUrl: TImages.bottom_fishing, information: TTexts.bottom_info, technics: TTexts.bottom_technic, equipments: TTexts.bottom_equipment, tipsAndTricks: TTexts.bottom_suggestion),
      FishingMethodsModels(name: 'úszó horgászat', imageUrl: TImages.float_fishing, information: TTexts.float_info, technics: TTexts.float_technic, equipments: TTexts.float_equipment, tipsAndTricks: TTexts.float_suggestion),
      FishingMethodsModels(name: 'feeder horgászat', imageUrl: TImages.feeder_fishing, information: TTexts.feeder_info, technics: TTexts.feeder_technic, equipments: TTexts.feeder_equipment, tipsAndTricks: TTexts.feeder_suggestion),
      FishingMethodsModels(name: 'bojli horgászat', imageUrl: TImages.boilie_fishing, information: TTexts.boilie_info, technics: TTexts.boilie_technic, equipments: TTexts.boilie_equipment, tipsAndTricks: TTexts.boilie_suggestion),
      FishingMethodsModels(name: 'legyező horgászat', imageUrl: TImages.fly_fishing, information: TTexts.fly_info, technics: TTexts.fly_technic, equipments: TTexts.fly_equipment, tipsAndTricks: TTexts.fly_suggestion),
      FishingMethodsModels(name: 'pergető horgászat', imageUrl: TImages.spinner_fishing, information: TTexts.spinning_info, technics: TTexts.spinning_technic, equipments: TTexts.spinning_equipment, tipsAndTricks: TTexts.spinning_suggestion),
    ];


    return Scaffold(
      appBar: TAppBar(
        title: Text('Módszerek', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TFishesLayout(
                itemCount: fishingMethods.length,
                itemBuilder: (_, index) => TFishingMethodsCards(fishingMethods: fishingMethods[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
