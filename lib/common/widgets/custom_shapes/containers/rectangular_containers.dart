import 'package:flutter/material.dart';
import '../../../../utils/constans/colors.dart';

class TRectangularContainer extends StatelessWidget {
  const TRectangularContainer({
    super.key,
    this.child,
    this.width = 700,
    this.height = 400,
    this.borderRadius = 0,
    this.padding = 0,
    this.backgroundColor = TColors.white,
    this.rotationAngle = 0,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final double rotationAngle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
