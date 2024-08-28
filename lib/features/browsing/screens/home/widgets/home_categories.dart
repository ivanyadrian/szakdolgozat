import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/styles/counties_shimmer.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/counties_controller.dart';
import 'package:szakdolgozat_app/features/browsing/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countiesController = Get.put(CountiesController());

    return Obx(() {
      if (countiesController.isLoading.value) return const TCountiesShimmer();

      if(countiesController.featureCounties.isEmpty){
        return Center(child: Text('Nem található adat', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: countiesController.featureCounties.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final counties = countiesController.featureCounties[index];
              return TVerticalImageText(image: counties.image, title: counties.name, onTap: () => Get.to(() => const SubCategoriesScreen()));
            },
          ),
        );
      }
    );
  }
}
