import 'package:acadocen/UI/pages/group_list.dart';
import 'package:acadocen/UI/pages/schedule.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listRoute = [
      const Schedule(),
      const GroupList(),
    ];
    return listRoute[index];
  }
}
