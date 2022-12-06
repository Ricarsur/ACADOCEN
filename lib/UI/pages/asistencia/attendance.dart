import 'package:acadocen/domain/services/student/data_student.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../students/students_list.dart';

class AttendanceQuery extends StatefulWidget {
  final String? idCourse;
  final String? idGroup;
  const AttendanceQuery({super.key, this.idCourse, this.idGroup});

  @override
  State<AttendanceQuery> createState() => _AttendanceQueryState();
}

class _AttendanceQueryState extends State<AttendanceQuery> {
  DataStudent student = DataStudent();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                          Get.to(StudentList(
                              idCourse: widget.idCourse,
                              idGroup: widget.idGroup));
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Text('Listado de asistencias',
                        style: TextStyle(fontSize: 22, color: ColorsApp.title)
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 20),
                FutureBuilder(
                    future: student.getAttendence(
                        widget.idGroup!, widget.idCourse!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: student.dataStudent.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: InkWell(
                                  onTap: () {},
                                  onLongPress: () {
                                    _eliminar(
                                        context,
                                        widget.idGroup!,
                                        widget.idCourse!,
                                        student.dataStudent[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          ColorsApp.gradiant1,
                                          ColorsApp.gradiant2,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17.0, vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${student.dataStudent[index]}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800)),
                                          Image.asset('assets/images/arrow.png',
                                              width: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
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
                        );
                      }
                    })
              ]),
            )),
          ),
        ),
      ),
    );
  }

  _eliminar(context, String group, String course, String nombre) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar asistencia'),
              content: Text('Realmente desea eliminar ${nombre}'),
              actions: [
                TextButton(
                    onPressed: () {
                      student.deleteAttendance(group, course, nombre);
                      Navigator.pop(context);
                      build(context);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }
}
