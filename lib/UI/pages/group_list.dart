import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Text('Listado de grupos',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ));
  }
}
