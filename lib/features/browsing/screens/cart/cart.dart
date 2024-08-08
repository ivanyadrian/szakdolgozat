import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/cart/widgets/cart_item.dart';
import 'package:szakdolgozat_app/features/browsing/screens/checkout/checkout.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Kosár', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),

        /// ITEMS IN CART
        child: TCartItems(),
      ),

      /// CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$350'),),
      ),
    );
  }
}

