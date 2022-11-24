import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
  });

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
          activeColor: ColorsApp.gradiant1,
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
        ),
      ],
    );
  }
}
