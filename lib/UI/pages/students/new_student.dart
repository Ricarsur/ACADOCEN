import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/domain/services/Materia/consul_materia.dart';
import 'package:acadocen/domain/services/Materia/materia.dart';
import 'package:acadocen/domain/services/user/data_profile.dart';
import 'package:flutter/material.dart';

class NewStudent extends StatelessWidget {
  DataCourse dataCourse = DataCourse();

  DataProfile dataProfile = DataProfile();

  final TextEditingController _nombreEstudent = TextEditingController();

  final TextEditingController _idEstudent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        BackgroundPage(
            fontSize: 25,
            title: 'Nuevo estudiante',
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height / 6),
                child: Column(
                  children: [
                    TexField(
                        text: 'Identificacion',
                        type: TextInputType.text,
                        controllerText: _idEstudent),
                    SizedBox(height: 50),
                    TexField(
                        text: 'Nombre del estudiante',
                        type: TextInputType.text,
                        controllerText: _nombreEstudent),
                    const SizedBox(height: 30),
                    SizedBox(height: 50),
                    Button(
                      text: 'Registrar',
                      onPressed: () async {
                        await dataProfile.createMateria(
                          Materia(
                            nombreCourse: _nombreEstudent.text,
                          ),
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
