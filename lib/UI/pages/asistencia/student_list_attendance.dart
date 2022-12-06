import 'package:acadocen/domain/services/student/data_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../misc/colors.dart';
import '../../widgets/assistance_student.dart';

class StudentListAttendance extends StatefulWidget {
  final String? idCourse;
  final String? idGroup;
  final String? nombre;

  const StudentListAttendance(
      {super.key, this.idCourse, this.idGroup, this.nombre});

  @override
  State<StudentListAttendance> createState() => _StudentListAttendanceState();
}

class _StudentListAttendanceState extends State<StudentListAttendance> {
  late DataStudent dataStudents = DataStudent();
  void refrescar() {
    Get.forceAppUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    InkWell(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: Color.fromRGBO(84, 100, 255, 1),
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                          refrescar();
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Text('Listado de alumnos',
                        style: TextStyle(fontSize: 22, color: ColorsApp.title)
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre ',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w800,
                            fontSize: 19)),
                    Spacer(),
                    Column(
                      children: [
                        Text(widget.idCourse!,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 106, 106, 106),
                                fontWeight: FontWeight.w600)),
                        Text(widget.idGroup!,
                            style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 68, 68, 68))
                                .copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FutureBuilder(
                    future: dataStudents.getListStudents(
                        widget.idGroup!, widget.idCourse!, widget.nombre!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: dataStudents.dataStudent.length,
                            itemBuilder: (context, index) {
                              return AssistanceStudent(
                                  nameStudent: dataStudents.dataStudent[index]);
                            });
                      } else {
                        return Center(
                            child: Center(
                          child: SpinKitFadingCube(
                            size: 30,
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: ColorsApp.gradiant1,
                                ),
                              );
                            },
                          ),
                        ));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
