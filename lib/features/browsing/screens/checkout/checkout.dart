import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/common/widgets/success_screen/success_screen.dart';
import 'package:szakdolgozat_app/features/browsing/screens/cart/widgets/cart_item.dart';
import 'package:szakdolgozat_app/features/browsing/screens/checkout/widgets/billing_address_section.dart';
import 'package:szakdolgozat_app/features/browsing/screens/checkout/widgets/billing_amount_section.dart';
import 'package:szakdolgozat_app/features/browsing/screens/checkout/widgets/billing_payment_section.dart';
import 'package:szakdolgozat_app/navigation_menu.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Kosár', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// ITEMS IN CART
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// COUPON TEXTFIELD
              const TCouponCode(),
              const SizedBox(height: TSize.spaceBetweenSections),

              /// BILLING SECTION
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(children: [
                  /// PRICING
                  TBillingAmountSection(),
                  SizedBox(height: TSize.spaceBetweenItems),

                  /// DIVIDER
                  Divider(),
                  SizedBox(height: TSize.spaceBetweenSections),

                  /// PAYMENT METHOD
                  TBillingPaymentSection(),
                  SizedBox(height: TSize.spaceBetweenSections),

                  /// ADDRESS
                  TBillingAddressSection()
                ]),
              ),
            ],
          ),
        ),
      ),

      /// CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.succesVerify,
                    title: 'Sikeres Fizetés',
                    subTitle: 'A vásárolt termékek hamarosan eljutnak önhöz!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Checkout \$366')),
      ),
    );
  }
}
