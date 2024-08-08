import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/rectangular_containers.dart';

import '../../../../utils/constans/colors.dart';
import '../edges/curved_edges_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.lighterGreen,

        padding: const EdgeInsets.all(0),
        ///padding: const EdgeInsets.only(bottom: 0),

        child: Stack(
          children: [
            ///Positioned(top: -320, right: 0, child: TRectangularContainer(backgroundColor: TColors.darkGreen.withOpacity(0.4))),
            Positioned(top: -200, right: 150, child: TRectangularContainer(backgroundColor: TColors.darkGreen.withOpacity(0.2), rotationAngle: 34)),
            Positioned(top: 100, right: 50, child: TRectangularContainer(backgroundColor: TColors.darkGreen.withOpacity(0.2), rotationAngle: 4)),
            ///Positioned(top: 250, right: -250, child: TCircularContainer(backgroundColor: TColors.darkGreen.withOpacity(0.2))),
            ///Positioned(top: 250, right: 250, child: TCircularContainer(backgroundColor: TColors.darkGreen.withOpacity(0.2))),
            child,
          ],
        ),
      ),
    );
  }
}
