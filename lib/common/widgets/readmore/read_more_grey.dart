import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../utils/constans/colors.dart';

class TReadMoreGrey extends StatelessWidget {
  const TReadMoreGrey({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimExpandedText: '  Kevesebb',
      trimCollapsedText: '  Több',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primaryColor),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 14.0,
      ),
      textAlign: TextAlign.justify,
    );
  }
}