import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        BackgroundPage(
            title: 'Nuevo grupo',
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height / 6),
                child: Column(
                  children: [
                    TexField(text: 'Materia', type: TextInputType.text),
                    const SizedBox(height: 20),
                    TexField(text: 'Grupo', type: TextInputType.text),
                    const SizedBox(height: 30),
                    SizedBox(height: 50),
                    Button(
                      text: 'Crear grupo',
                      onPressed: () {},
                      width: 200,
                    ),
                  ],
                ),
              ),
            ])),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ],
    )));
  }
}
