import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Menu(
            imagen1: 'assets/svg/iconHome2.svg',
            imagen2: 'assets/svg/IconPersons2.svg',
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
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
            )));
  }
}
