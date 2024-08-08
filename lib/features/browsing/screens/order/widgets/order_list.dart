import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constans/colors.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: TSize.spaceBetweenItems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSize.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                /// 1 ICON
                const Icon(Iconsax.ship),
                const SizedBox(width: TSize.spaceBetweenItems / 2),

                /// 2 STATUS
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Folyamatban',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primaryColor, fontWeightDelta: 1),
                      ),
                      Text('2024.01.03', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// 3 ICON
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3_copy, size: TSize.iconSm)),
              ],
            ),
            const SizedBox(height: TSize.spaceBetweenItems),

            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 ICON
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSize.spaceBetweenItems / 2),

                      /// 2 STATUS
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rendelés', style: Theme.of(context).textTheme.labelMedium),
                            Text('#53223', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// 1 ICON
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSize.spaceBetweenItems / 2),

                      /// 2 STATUS
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Várható szállítás', style: Theme.of(context).textTheme.labelMedium),
                            Text('2024.01.07', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
