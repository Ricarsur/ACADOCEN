import 'package:acadocen/UI/pages/qr/scanQr.dart';
import 'package:acadocen/UI/widgets/button.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/services/student/data_student.dart';
import 'package:acadocen/domain/utils/date_utils.dart' as date_utils;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/estudiante.dart';
import '../../../models/materia.dart';
import '../../widgets/assistance_student.dart';
import '../asistencia/attendance.dart';

class StudentList extends StatefulWidget {
  final String? idCourse;
  final String? idGroup;
  const StudentList({super.key, this.idCourse, this.idGroup});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final List<Estudiante> lista = [];

  void refrescar() {
    Get.forceAppUpdate();
  }

  DataStudent data = DataStudent();
  late ScrollController scrollController;
  List<DateTime> currentMonthsList = List.empty();
  DateTime _dateNow = DateTime.now();
  late String monthName = DateFormat('MMM').format(_dateNow);

  final TextEditingController _identificacion = TextEditingController();
  final TextEditingController _nombre = TextEditingController();

  void initState() {
    super.initState();
    currentMonthsList = date_utils.DateUtils.daysInMonth(_dateNow);
    currentMonthsList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthsList = currentMonthsList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * _dateNow.day);
  }

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                heroTag: "btn1",
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.to(() => AttendanceQuery(
                      idCourse: widget.idCourse, idGroup: widget.idGroup));
                },
              ),
            ),
            SizedBox(width: 14),
            Button(
              text: 'Enviar',
              onPressed: () async {
                if (lista.length > 0) {
                  await data.createAttendance(
                      widget.idGroup!, DateTime.now(), widget.idCourse!, lista);
                } else {
                  Get.snackbar('Error', 'No hay estudiantes para enviar');
                }
              },
              width: 140,
            ),
            SizedBox(width: 14),
            Container(
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
                heroTag: "btn2",
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  _identificacion.text = '';
                  _nombre.text = '';
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Agregar Estudiante'),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: _identificacion,
                              decoration: InputDecoration(
                                hintText: 'Identifiacion',
                              ),
                            ),
                            TextField(
                              controller: _nombre,
                              decoration: InputDecoration(
                                hintText: 'Nombre completo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_identificacion.text.isNotEmpty &&
                                _nombre.text.isNotEmpty) {
                              lista.add(Estudiante(
                                  materia: Materia(
                                      nombreCourse: widget.idCourse!,
                                      numberGroup: widget.idGroup!),
                                  uid: _identificacion.text,
                                  nombre: _nombre.text));
                              Navigator.pop(context, 'OK');
                            } else {
                              Get.snackbar('Error', 'Campos vacios');
                            }
                          },
                          child: const Text('Agregar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: Color.fromRGBO(84, 100, 255, 1),
                    iconSize: 30,
                    onPressed: () {
                      Get.to(() => GroupList(idCourse: widget.idCourse!));
                    },
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Asistencia',
                          style: TextStyle(fontSize: 22, color: ColorsApp.title)
                              .copyWith(fontWeight: FontWeight.bold)),
                      RichText(
                        text: TextSpan(
                          text: 'Curso: ',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsApp.title,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.idGroup,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[500])),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Get.to(() => const ScanQr());
                      },
                      child:
                          Image.asset('assets/images/scaner.png', height: 20))
                ],
              ),
              SizedBox(height: 20),
              Row(
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
                      Text(
                          date_utils.DateUtils.months[_dateNow.month - 1] +
                              ' ' +
                              _dateNow.day.toString() +
                              ', ' +
                              _dateNow.year.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 106, 106, 106),
                              fontWeight: FontWeight.w600)),
                      Text(widget.idCourse!,
                          style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 68, 68, 68))
                              .copyWith(fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return AssistanceStudent(nameStudent: lista[index].nombre);
                },
              )
              //AssistanceStudent(nameStudent: 'David Ravelo Bonett'),
            ]),
          )),
        ),
      ),
    );
  }
}
