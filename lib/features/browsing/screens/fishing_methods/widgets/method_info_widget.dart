import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/readmore/read_more_grey.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/readmore/read_more_grey_list.dart';
import '../../../../../utils/constans/colors.dart';

class TMethodInfoWidget extends StatelessWidget {
  final String information;
  final List<String> equipments;
  final String technics;
  final String tipsAndTricks;

  const TMethodInfoWidget({
    Key? key,
    required this.information,
    required this.equipments,
    required this.technics,
    required this.tipsAndTricks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadMoreText(
          information,
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimExpandedText: '  Kevesebb',
          trimCollapsedText: '  Több',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: TColors.primaryColor,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: TColors.primaryColor,
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.0,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: TSize.defaultSpace),

        _buildSectionHeader(context, "Teknikák"),
        SizedBox(height: TSize.spaceBetweenItems),
        TReadMoreGrey(text: technics),
        SizedBox(height: TSize.defaultSpace),

        _buildSectionHeader(context, "Felszerelés"),
        SizedBox(height: TSize.spaceBetweenItems),
        TReadMoreGreyList(textList: equipments),
        SizedBox(height: TSize.defaultSpace),

        _buildSectionHeader(context, "Javaslatok"),
        SizedBox(height: TSize.spaceBetweenItems),
        TReadMoreGrey(text: tipsAndTricks),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: dark ? TColors.black : TColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: dark ? TColors.white : TColors.black,
        ),
      ),
    );
  }
}
