import 'package:flutter/material.dart';

String vista = 'Seleccione una vista';

class Combobox extends StatefulWidget {
  final List<dynamic> list;
  const Combobox({super.key, required this.list});

  @override
  State<Combobox> createState() => _ComboboxState();
}

class _ComboboxState extends State<Combobox> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget.list.map((dynamic value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (dynamic value) => {
        setState(() {
          vista = value;
        })
      },
      hint: Text(vista),
    );
  }
}
