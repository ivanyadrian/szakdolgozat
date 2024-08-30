import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/fishes_layout.dart';
import 'package:szakdolgozat_app/features/browsing/screens/fish_types/widgets/fish_type_cards.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/constans/text_strings.dart';

import '../../../../utils/constans/image_strings.dart';
import 'models/fish_type_modell.dart';

class TFishTypes extends StatelessWidget {
  const TFishTypes({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of fish types
    final List<FishTypeModel> fishTypes = [
      FishTypeModel(name: 'csuka', imageUrl: TImages.pike, information: TTexts.pikeInfo, livePlace: TTexts.pikeLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'ponty', imageUrl: TImages.common_carp, information: TTexts.common_carpInfo, livePlace: TTexts.common_carpLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'mindenevő'),
      FishTypeModel(name: 'harcsa', imageUrl: TImages.catfish, information: TTexts.catfishInfo, livePlace: TTexts.catfishLivePlaceInfo, season: ['tavasz','nyár'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'süllő', imageUrl: TImages.zander, information: TTexts.zanderInfo, livePlace: TTexts.zanderLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'balin', imageUrl: TImages.asp, information: TTexts.aspInfo, livePlace: TTexts.aspLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'amur', imageUrl: TImages.grass_carp, information: TTexts.grass_carpInfo, livePlace: TTexts.grass_carpLivePlaceInfo, season: ['tavasz','nyár'], feedingType: 'növényevő'),
      FishTypeModel(name: 'kárász', imageUrl: TImages.crucian_carp, information: TTexts.crucian_carpInfo, livePlace: TTexts.crucian_carpLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'mindenevő'),
      FishTypeModel(name: 'dévérkeszeg', imageUrl: TImages.white_bream, information: TTexts.white_breamInfo, livePlace: TTexts.white_breamLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'mindenevő'),
      FishTypeModel(name: 'busa', imageUrl: TImages.silver_carp, information: TTexts.silver_carpInfo, livePlace: TTexts.silver_carpLivePlaceInfo, season: ['tavasz','nyár'], feedingType: 'növényevő'),
      FishTypeModel(name: 'pisztráng', imageUrl: TImages.trout, information: TTexts.troutInfo, livePlace: TTexts.troutLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'domolykó', imageUrl: TImages.chub, information: TTexts.chubInfo, livePlace: TTexts.chubLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'ragadozó'),
      FishTypeModel(name: 'márna', imageUrl: TImages.barbel, information: TTexts.barbelInfo, livePlace: TTexts.barbelLivePlaceInfo, season: ['tavasz','ősz'], feedingType: 'mindenevő'),
      FishTypeModel(name: 'compó', imageUrl: TImages.tench, information: TTexts.tenchInfo, livePlace: TTexts.tenchLivePlaceInfo, season: ['tavasz','nyár'], feedingType: 'mindenevő'),
    ];


    return Scaffold(
      appBar: TAppBar(
        title: Text('Halfajták', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TFishesLayout(
                itemCount: fishTypes.length,
                itemBuilder: (_, index) => TFishTypeCards(fishType: fishTypes[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
