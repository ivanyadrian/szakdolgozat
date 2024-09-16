import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/shimmers/counties_shimmer.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/county_controller.dart';
import 'package:szakdolgozat_app/features/browsing/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCounties extends StatelessWidget {
  const THomeCounties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countyController = Get.put(CountyController());

    return Obx(() {
      if (countyController.isLoading.value) return const TCountiesShimmer();

      if(countyController.featureCounties.isEmpty){
        return Center(child: Text('Nem található adat', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: countyController.featureCounties.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final county = countyController.featureCounties[index];
              return TVerticalImageText(image: county.image, title: county.name, onTap: () => Get.to(() => const SubCategoriesScreen()));
            },
          ),
        );
      }
    );
  }
}
