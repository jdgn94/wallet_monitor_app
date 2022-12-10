import 'package:flutter/material.dart';

class DropdownGlobal extends StatelessWidget {
  final Map<String, String> value;
  final List<Map<String, String>> items;
  final Function onChanged;
  final IconData? icon;

  const DropdownGlobal({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DropdownButton<Map<String, String>>(
        value: value,
        icon: Icon(icon ?? Icons.arrow_downward),
        isExpanded: true,
        menuMaxHeight: 400.0,
        hint: Text('hola'),
        onChanged: (Map<String, String>? valueSelected) =>
            onChanged(context, valueSelected),
        items: items.map<DropdownMenuItem<Map<String, String>>>(
          (Map<String, String> item) {
            return DropdownMenuItem<Map<String, String>>(
              value: item,
              child: Text(item['text'] ?? ''),
            );
          },
        ).toList(),
      ),
    );
  }
}
