import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/brand/brand_card.dart';
import 'package:szakdolgozat_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class BrandProducts extends StatelessWidget {
  final String countyName;

  const BrandProducts({super.key, required this.countyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(countyName), showBackArrow: true), // Use the county name dynamically
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: const [
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

