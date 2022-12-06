import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/models/materia.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'group_list.dart';

class NewGroup extends StatefulWidget {
  final String idCourse;
  const NewGroup({super.key, required this.idCourse});
  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  void refrescar() {
    Get.forceAppUpdate();
  }

  DataProfile dataProfile = DataProfile();

  final TextEditingController _numberGroup = TextEditingController();

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
              title: 'Nuevo grupo',
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: MediaQuery.of(context).size.height / 6),
                  child: Column(
                    children: [
                      TexField(
                          text: 'Número de grupo',
                          type: TextInputType.text,
                          controllerText: _numberGroup),
                      const SizedBox(height: 30),
                      SizedBox(height: 50),
                      Button(
                        text: 'Crear grupo',
                        onPressed: () async {
                          await dataProfile.createGroupMateria(
                            Materia(
                                numberGroup: _numberGroup.text,
                                uid: widget.idCourse.toString()),
                          );
                          await DataProfile.getMateria();
                          refrescar();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupList(
                          idCourse: widget.idCourse,
                        ),
                      ),
                    );
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
