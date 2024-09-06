import 'dart:io';
import 'package:flutter/material.dart';

// Define a new widget for a rounded image
class TRoundedImageInList extends StatelessWidget {
  final File imageFile;
  final double width;
  final double height;
  final double borderRadius;

  // Constructor to accept the image file, dimensions, and border radius
  const TRoundedImageInList({
    Key? key,
    required this.imageFile,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        imageFile,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
