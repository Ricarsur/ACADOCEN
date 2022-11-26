import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/domain/services/Materia/consul_materia.dart';
import 'package:acadocen/domain/services/Materia/materia.dart';
import 'package:acadocen/domain/services/user/data_profile.dart';
import 'package:flutter/material.dart';

class NewGroup extends StatelessWidget {
  DataCourse dataCourse = DataCourse();

  DataProfile dataProfile = DataProfile();

  final TextEditingController _numberGroup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        BackgroundPage(
            fontSize: 30,
            title: 'Nuevo grupo',
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height / 6),
                child: Column(
                  children: [
                    TexField(
                        text: 'Nombre del grupo',
                        type: TextInputType.text,
                        controllerText: _numberGroup),
                    const SizedBox(height: 30),
                    SizedBox(height: 50),
                    Button(
                      text: 'Crear grupo',
                      onPressed: () async {
                        await dataProfile.createGroupMateria(
                          NumberMateria(numberGoup: _numberGroup.text),
                        );
                      },
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
