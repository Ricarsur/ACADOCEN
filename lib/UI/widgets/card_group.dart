import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardGroup extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CardGroup({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: onPressed,
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
              leading: const Icon(Icons.group_outlined, color: Colors.white),
              title: Text(name,
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {
                  onPressed();
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
