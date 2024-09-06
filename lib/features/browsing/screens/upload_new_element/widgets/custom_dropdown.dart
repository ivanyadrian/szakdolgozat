import 'package:flutter/material.dart';

class TCustomDropdown extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final Icon prefixIcon;

  const TCustomDropdown({
    Key? key,
    required this.labelText,
    required this.items,
    this.value,
    required this.onChanged,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Válassz ki egy lehetőséget';
        }
        return null;
      },
    );
  }
}
