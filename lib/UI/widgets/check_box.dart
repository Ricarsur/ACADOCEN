import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String text;
  const CheckBox({super.key, required this.text});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = !_value;
            });
          },
        ),
        Expanded(
          child: Text(
            widget.text,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 80, 80, 80),
            ),
          ),
        ),
      ],
    );
  }
}
