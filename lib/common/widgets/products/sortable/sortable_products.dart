import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constans/size.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// DROPDOWN
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          onChanged: (value) {},
          items: ['Név', 'Értékelés', 'Típus']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSize.spaceBetweenSections),

        /// PRODUCTS
        TGridLayout(itemCount: 7, itemBuilder: (_, index) => const TProductCardVertical()),
      ],
    );
  }
}