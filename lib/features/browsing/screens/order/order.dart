import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/order/widgets/order_list.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Rendeléseim', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),

        /// ORDERS
        child: TOrderListItems(),
      ),
    );
  }
}
