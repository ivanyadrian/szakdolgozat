import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/tabbar.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:szakdolgozat_app/common/widgets/layouts/grid_layout.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/counties_controller.dart';
import 'package:szakdolgozat_app/features/browsing/screens/brand/all_brands.dart';
import 'package:szakdolgozat_app/features/browsing/screens/search/widgets/category_tab.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brand/brand_card.dart';
import '../brand/brand_products.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counties = CountiesController.instance.featureCounties;

    return DefaultTabController(
      length: counties.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Kereső',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          /*
          actions: [
            TCartCountericon(onPressed: (){}, iconColor: Colors.white,),
          ],
          */
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBpxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true, ///appbar nem fog mozogni
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
                          /// SEAARCHBAR
                          const SizedBox(height: TSize.spaceBetweenItems),
                          const TSearchContainer(
                              text: 'Kezd el begépelni a hely nevét',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: TSize.spaceBetweenSections),

                          /// FEATURED BRANDS
                          TSectionHeading(
                              title: 'Elérhető helyek',
                              showActionButton: true,
                              onPressed: () => Get.to(() => const AllBrandsScreen())),
                          const SizedBox(height: TSize.spaceBetweenItems / 1.5),

                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return TBrandCard(showBorder: true, onTab: () => Get.to(() => const BrandProducts()));
                              })
                        ],
                      ),
                    ),
                    bottom:TTabBar(
                      tabs: counties.map((county) => Tab(child: Text(county.name))).toList()
                    ),
                ),
              ];
            },
            body: TabBarView(
              children: counties.map((county) => TCategoryTab(county: county)).toList()
            ),
        ),
      ),
    );
  }
}

