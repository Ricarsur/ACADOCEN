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
    return Container(
      width: 600,
      padding: const EdgeInsets.only(left: 13),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3))
          ]),
      child: DropdownButton(
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
      ),
    );
  }
}
