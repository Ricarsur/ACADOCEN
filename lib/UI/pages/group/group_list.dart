import 'package:acadocen/UI/pages/course/course_list.dart';
import 'package:acadocen/UI/pages/course/new_group.dart';
import 'package:acadocen/UI/pages/students/students_list.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/services/user/data_profile.dart';
import 'package:flutter/material.dart';

import '../../widgets/card_course.dart';

class GroupList extends StatefulWidget {
  final String idCourse;
  const GroupList({super.key, required this.idCourse});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  DataProfile dataProfile = DataProfile();
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
            Get.to(() => NewGroup(
                  idCourse: widget.idCourse,
                ));
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
                        Get.to(() => CourseList());
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('Listado de cursos',
                      style: TextStyle(fontSize: 22, color: ColorsApp.title)
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              FutureBuilder(
                  future: dataProfile.getGroup(widget.idCourse),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dataProfile.dataID.length,
                          itemBuilder: (context, index) {
                            return CardCourse(
                              name: dataProfile.dataID[index].numberGoup
                                  .toString(),
                              onPressed: () {
                                Get.to(() => StudentList());
                              },
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ]),
          )),
        ),
      ),
    );
  }
}
