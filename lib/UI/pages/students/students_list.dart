import 'package:acadocen/UI/widgets/assistance_student.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/utils/date_utils.dart' as date_utils;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/button.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late ScrollController scrollController;
  List<DateTime> currentMonthsList = List.empty();
  DateTime _dateNow = DateTime.now();
  late String monthName = DateFormat('MMM').format(_dateNow);

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
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Asistencia',
                          style: TextStyle(fontSize: 22, color: ColorsApp.title)
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        'Matematicas',
                        style: TextStyle(fontSize: 16, color: Colors.grey[500])
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {},
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
                ],
              ),
              SizedBox(height: 10),
              AssistanceStudent(nameStudent: 'David Ravelo Bonett'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    text: 'Enviar asistencia',
                    onPressed: () {},
                    width: 200,
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
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ]),
          )),
        ),
      ),
    );
  }
}