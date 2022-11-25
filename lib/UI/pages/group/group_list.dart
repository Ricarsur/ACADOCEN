import 'package:acadocen/UI/pages/course/new_group.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/card_course.dart';
import '../students/students_list.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorsApp.gradiant1,
              ColorsApp.gradiant2,
            ],
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(() => NewGroup());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(children: [
              Row(
                children: [
                  InkWell(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Color.fromRGBO(84, 100, 255, 1),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('Listado de materias',
                      style: TextStyle(fontSize: 22, color: ColorsApp.title)
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              CardCourse(
                name: 'Grupo 01',
                onPressed: () {
                  Get.to(() => const StudentList());
                },
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
