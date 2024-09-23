import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/brand/brand_card.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/brand/all_spots_by_county.dart';
import 'package:szakdolgozat_app/features/browsing/screens/brand/brand_products.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../controllers/fishingspot_controller.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FishingSpotController controller = FishingSpotController.instance;

    return Scaffold(
      appBar: const TAppBar(title: Text('Vármegyék'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// HEADING
              const TSectionHeading(
                title: 'Összes hely megjelenítése megyénként',
                showActionButton: false,
              ),
              const SizedBox(height: TSize.spaceBetweenItems*2),

              /// DINAMIKUS MEGYELISTA
              FutureBuilder<List<String>>(
                future: controller.fishingSpotRepository.getAllCounties(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: TShimmerEffect(width: double.infinity, height: double.infinity));
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Hiba: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nincs elérhető megye.'));
                  }

                  /// Megyék rendezése ábécé sorrendben
                  final counties = snapshot.data!..sort(); // Az ábécé sorrend

                  return TGridLayout(
                    itemCount: counties.length,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) {
                      final county = counties[index];

                      return FutureBuilder<int>(
                        future: controller.getFishingSpotCountByCounty(county),
                        builder: (context, spotCountSnapshot) {
                          if (spotCountSnapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: TShimmerEffect(width: double.infinity, height: double.infinity));
                          }

                          if (spotCountSnapshot.hasError) {
                            return Center(child: Text('Hiba: ${spotCountSnapshot.error}'));
                          }

                          final spotCount = spotCountSnapshot.data ?? 0;

                          return TBrandCard(
                            showBorder: true,
                            onTab: () => Get.to(() => CountyFishingSpotsScreen(countyName: county)),
                            countyName: county,
                            spotCount: spotCount,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

