import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/custom_shapes/containers/circular_containers.dart';
import '../../../utils/constans/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: selected
            ? const TCircularContainer(
          width: 50,
          height: 50,
          backgroundColor: Colors.green,
        )
            : null,
      ),
    );
  }
}
