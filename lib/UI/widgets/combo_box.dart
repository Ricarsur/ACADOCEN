import 'package:flutter/material.dart';

class Combobox extends StatefulWidget {
  final TextEditingController? controllerText;
  final List<dynamic> list;
  final String? title;
  String hintText;
  Combobox({
    super.key,
    required this.list,
    this.title,
    this.controllerText,
    required this.hintText,
  });

  @override
  State<Combobox> createState() => _ComboboxState();
}

class _ComboboxState extends State<Combobox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title ?? '',
            style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 80, 80, 80),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
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
            ],
          ),
          child: DropdownButton(
            underline: Container(),
            items: widget.list.map((dynamic value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (dynamic value) => {
              setState(() {
                widget.hintText = value;
                widget.controllerText!.text = value;
              })
            },
            hint: Text(widget.hintText),
          ),
        ),
      ],
    );
  }
}
