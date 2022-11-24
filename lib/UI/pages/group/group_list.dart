import 'package:acadocen/UI/widgets/list_group.dart';
import 'package:acadocen/domain/services/services.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size.width;
    return Material(
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 40),
              padding: EdgeInsets.all(10),
              child: Text(
                'Lista de grupos',
                style: TextStyle(
                        fontSize: _query * 0.05,
                        color: Color.fromARGB(212, 95, 95, 95))
                    .copyWith(fontWeight: FontWeight.bold)
                    .copyWith(fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
        Container(
          child: ListGroup(
              name: 'Base de datos',
              numberGroup: 'grupo 03',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              }),
        ),
      ]),
    );
  }
}
