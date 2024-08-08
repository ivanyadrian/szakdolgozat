import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/rectangular_containers.dart';
import '../../../../../utils/constans/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Positioned(top: -280, right: 200, child: TRectangularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1), rotationAngle: 34,)),
              Positioned(top: 100, right: 250, child: TRectangularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1), rotationAngle: 4,)),
            ],
          ),
        ));
  }
}
