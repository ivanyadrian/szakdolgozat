import 'package:flutter/material.dart';
import '../../../utils/constans/size.dart';

class TFishesLayout extends StatelessWidget {
  const TFishesLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: TSize.gridViewSpacing*2),
          child: itemBuilder(context, index),
        );
      },
    );
  }
}
