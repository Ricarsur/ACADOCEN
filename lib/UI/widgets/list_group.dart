import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListGroup extends StatelessWidget {
  final String name;
  final String numberGroup;
  final VoidCallback onPressed;

  const ListGroup(
      {super.key,
      required this.name,
      required this.numberGroup,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorsApp.gradiant1,
              ColorsApp.gradiant2,
            ]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.group, color: Colors.white),
            title: Text(name,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            subtitle: Text(numberGroup,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {
                onPressed();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
