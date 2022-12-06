import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/models/materia.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  refreshContext() {
    Get.forceAppUpdate();
  }

  DataProfile dataProfile = DataProfile();
  final TextEditingController _nameCourse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SingleChildScrollView(
              child: Stack(
        children: [
          BackgroundPage(
              fontSize: 30,
              title: 'Nueva materia',
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: MediaQuery.of(context).size.height / 6),
                  child: Column(
                    children: [
                      TexField(
                          text: 'Nombre de la materia',
                          type: TextInputType.text,
                          controllerText: _nameCourse),
                      const SizedBox(height: 30),
                      SizedBox(height: 50),
                      Button(
                        text: 'Crear materia',
                        onPressed: () async {
                          await dataProfile.verifyMateria(
                            Materia(
                              nombreCourse: _nameCourse.text,
                            ),
                          );
                          refreshContext();
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
                    Navigator.pop(Get.context!);
                  },
                ),
              )
            ],
          ),
        ],
      ))),
    );
  }
}
