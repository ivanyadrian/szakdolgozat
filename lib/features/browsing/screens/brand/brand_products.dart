import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/brand/brand_card.dart';
import 'package:szakdolgozat_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Borsod-Abaúj-Zemplén'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(height: TSize.spaceBetweenSections),

              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
