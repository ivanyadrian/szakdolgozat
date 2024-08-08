import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/features/browsing/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constans/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 19,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: TImages.bekes, title: 'Borsod-Abaúj-Zemplén', onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}
