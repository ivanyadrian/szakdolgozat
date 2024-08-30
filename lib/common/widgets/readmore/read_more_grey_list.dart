import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../utils/constans/colors.dart';

class TReadMoreGreyList extends StatelessWidget {
  const TReadMoreGreyList({
    super.key,
    required this.textList,
  });

  final List<String> textList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textList.map((equipments) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0), // Adds space between items
          child: ReadMoreText(
            equipments,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimExpandedText: '  Kevesebb',
            trimCollapsedText: '  Több',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColors.primaryColor
            ),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColors.primaryColor
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        );
      }).toList(),
    );
  }
}
