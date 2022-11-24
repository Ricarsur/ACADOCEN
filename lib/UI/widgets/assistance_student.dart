import 'package:acadocen/UI/widgets/check_box.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AssistanceStudent extends StatelessWidget {
  final nameStudent;

  const AssistanceStudent({super.key, required this.nameStudent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(nameStudent,
              overflow: TextOverflow.ellipsis,
              style: (TextStyle(
                  color: ColorsApp.title,
                  fontSize: 19,
                  fontWeight: FontWeight.w500))),
          Spacer(),
          CheckBox()
        ],
      ),
    );
  }
}
