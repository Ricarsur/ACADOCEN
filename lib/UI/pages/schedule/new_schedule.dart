import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class NewSchedule extends StatefulWidget {
  const NewSchedule({super.key});

  @override
  State<NewSchedule> createState() => _NewScheduleState();
}

class _NewScheduleState extends State<NewSchedule> {
  DateTime now = DateTime.now();
  late String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundPage(
                  title: 'Nuevo horario',
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                        vertical: MediaQuery.of(context).size.height / 6),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar dia',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: MaterialButton(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(formattedDate.toString(),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.calendar_month_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2015, 8),
                                      lastDate: DateTime(2101),
                                    );
                                  },
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar un grupo',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Combobox(
                                list: ['Grupo 01', 'Grupo 02'],
                                hintText: 'Seleccione un grupo',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Button(
                          text: 'Crear horario',
                          onPressed: () {},
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
