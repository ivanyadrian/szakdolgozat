import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/tabbar.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/shimmers/shimmer.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/brand/all_brands.dart';
import 'package:szakdolgozat_app/features/browsing/screens/brand/all_spots_by_county.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import '../../../../common/widgets/watertypes/watertypes_by_county.dart';
import '../../../../utils/constans/enums.dart';
import '../../controllers/fishingspot_controller.dart';
import '../brand/brand_products.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FishingSpotController controller = Get.put(FishingSpotController());

    return Obx(() {
      if (controller.counties.isEmpty) {
        return Scaffold(
          appBar: TAppBar(
            title: Text(
              'Kereső',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: const Center(child: CircularProgressIndicator()), // Show loading indicator while counties are being loaded
        );
      }

      final sortedCounties = List<String>.from(controller.counties)..sort();

      return DefaultTabController(
        length: sortedCounties.length,
        child: Scaffold(
          appBar: TAppBar(
            title: Text(
              'Kereső',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSize.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSize.spaceBetweenItems),
                        const TSearchContainer(
                          text: 'Kezd el begépelni a hely nevét',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSize.spaceBetweenSections),
                        TSectionHeading(
                          title: 'Elérhető helyek',
                          showActionButton: true,
                          onPressed: () => Get.to(() => const AllBrandsScreen()),
                        ),
                        const SizedBox(height: TSize.spaceBetweenItems / 1.5),

                        TGridLayout(
                          itemCount: 4,  // Dinamikusan a megyék száma alapján
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final county = sortedCounties[index];  // A megyéket soroljuk

                            return FutureBuilder<int>(
                              future: controller.getFishingSpotCountByCounty(county),  // Helyek számának lekérése
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: TShimmerEffect(width: double.infinity, height: double.infinity));
                                }

                                final spotCount = snapshot.data ?? 0;  // Ha nincs adat, akkor 0

                                return TBrandCard(
                                  showBorder: true,
                                  countyName: county,  // A megye neve
                                  spotCount: spotCount,  // A helyek száma
                                  onTab: () => Get.to(() => CountyFishingSpotsScreen(countyName: county)),  // A megfelelő megye átadása
                                );
                              },
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                  bottom: TTabBar(
                    tabs: sortedCounties.map((county) {
                      return Tab(text: county);
                    }).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: sortedCounties.map((county) {
                return FutureBuilder<void>(
                  future: controller.loadFishingSpotsByCounty(county),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: TShimmerEffect(width: double.infinity, height: double.infinity));
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Hiba történt: ${snapshot.error}'));
                    }

                    final waterTypeCounts = controller.countyWaterTypeData[county] ?? {};

                    if (waterTypeCounts.isEmpty) {
                      return const Center(child: Text('Nincs elérhető adat.'));
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 25, left: 32, right: 32),
                      child: ListView(
                        children: waterTypeCounts.entries.map((entry) {
                          final waterType = entry.key;
                          final count = entry.value;

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TWaterTypesByCounty(
                              showBorder: true,
                              waterType: waterType,
                              count: count,
                              onTab: () => Get.to(() => BrandProducts(
                                countyName: county,
                                waterType: waterType, // Víztípus átadása
                              )),
                            )
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }
}






