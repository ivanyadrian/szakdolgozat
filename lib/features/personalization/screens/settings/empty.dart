import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/details.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Tesztelés'), showBackArrow: true),
      body: Center(
        child: ProductDetailScreen(),
      ),
    );
  }
}
