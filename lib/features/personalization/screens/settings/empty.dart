import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Tesztelés'),),
    );
  }
}
