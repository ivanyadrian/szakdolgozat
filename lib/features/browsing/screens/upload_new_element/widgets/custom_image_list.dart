import 'dart:io';
import 'package:flutter/material.dart';

class TRoundedImageInList extends StatelessWidget {
  final File imageFile;
  final double width; // Width of the image
  final double height; // Height of the image
  final double borderRadius; // Border radius of the image

  // Constructor to accept the image file, dimensions, and border radius
  const TRoundedImageInList({
    Key? key,
    required this.imageFile,
    this.width = 100, // Default width
    this.height = 100, // Default height
    this.borderRadius = 10, // Default border radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        imageFile,
        width: width, // Use the provided or default width
        height: height, // Use the provided or default height
        fit: BoxFit.cover,
      ),
    );
  }
}
