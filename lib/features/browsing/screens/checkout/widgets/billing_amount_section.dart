import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SUBTOTAL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Összeg', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$350', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems / 2),


        /// Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Szállítás', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$5', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems / 2),

        /// TAX
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ÁFA', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$11', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBetweenItems / 2),

        /// ORDER TOTAL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Teljes összeg', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$366', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
