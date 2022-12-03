import 'package:acadocen/UI/pages/pages.dart';
import 'package:acadocen/domain/controller/materia/materia_controller.dart';
import 'package:acadocen/domain/services/horario/data_horario.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:acadocen/lib.dart';
import 'package:acadocen/models/shedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSchedule extends StatefulWidget {
  const NewSchedule({super.key});

  @override
  State<NewSchedule> createState() => _NewScheduleState();
}

class _NewScheduleState extends State<NewSchedule> {
  String hintText = 'Seleccione materia';
  DateTime now = DateTime.now();
  TimeOfDay timeInitial = TimeOfDay.now();
  TimeOfDay timeFinal = TimeOfDay.now();
  late String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);
  DataProfile dataProfile = DataProfile();

  final TextEditingController _materia = TextEditingController();
  final TextEditingController _grupos = TextEditingController();
  final TextEditingController _nombreHorario = TextEditingController();
  ControllerMateria controllerMateria = Get.find();
  String materiaBuscar = '';
  @override
  Widget build(BuildContext context) {
    var data = controllerMateria.materia!.map((e) => e.nombreCourse).toList();
    controllerMateria.getMateria().then((value) => value);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundPage(
                  fontSize: 30,
                  title: 'Nuevo horario',
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                        vertical: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TexField(
                                text: 'Nombre del horario',
                                type: TextInputType.text,
                                controllerText: _nombreHorario),
                            SizedBox(height: 30),
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
                                        Text(
                                            '${now.day}/${now.month}/${now.year}',
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
                                  onPressed: () async {
                                    DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        firstDate: DateTime(2015, 8),
                                        lastDate: DateTime(2101));
                                    if (picked == null) return;
                                    setState(() => now = picked);
                                  },
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar hora inicial',
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
                                        Text('${timeInitial.format(context)}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (pickedTime == null) return;
                                    setState(() => timeInitial = pickedTime);
                                  },
                                )),
                            SizedBox(height: 30),
                            Text(
                              'Seleccionar hora final',
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
                                        Text('${timeFinal.format(context)}',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    212, 95, 95, 95))),
                                        Center(
                                            child: Icon(
                                          Icons.access_time_outlined,
                                          color:
                                              Color.fromARGB(212, 95, 95, 95),
                                        ))
                                      ],
                                    ),
                                  ),
                                  minWidth: 400,
                                  height: 50,
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (pickedTime == null) return;
                                    setState(() => timeFinal = pickedTime);
                                  },
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seleccionar materia',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('usuario')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('materias')
                                      .orderBy('nombre')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text('Cargando...');
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        width: 600,
                                        padding:
                                            const EdgeInsets.only(left: 13),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                blurRadius: 5,
                                                spreadRadius: 2,
                                                offset: const Offset(0, 3))
                                          ],
                                        ),
                                        child: DropdownButton(
                                          underline: Container(),
                                          items: snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                document['nombre'],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        211, 15, 15, 15)),
                                              ),
                                              value: document['nombre'],
                                            );
                                          }).toList(),
                                          onChanged: (dynamic value) => {
                                            setState(() {
                                              materiaBuscar = value;
                                              hintText = value;
                                              _materia.text = value;
                                            })
                                          },
                                          hint: Text(hintText),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                        SizedBox(height: 35),
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
                            materiaBuscar != ''
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('usuario')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('materias')
                                            .doc(materiaBuscar)
                                            .collection('grupos')
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (!snapshot.hasData) {
                                            return Text('Cargando...');
                                          }
                                          return Combobox(
                                            hintText: "Seleccionar grupo",
                                            list: snapshot.data!.docs
                                                .map((e) => e['nombre'])
                                                .toList(),
                                            controllerText: _grupos,
                                          );
                                        }),
                                  )
                                : Combobox(
                                    hintText: "Seleccionar grupo",
                                    list: [],
                                    controllerText: _grupos,
                                  ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Button(
                          text: 'Crear horario',
                          onPressed: () async {
                            await DataHorario.createSchedule(
                              Shedule(
                                  nombreHorario: _nombreHorario.text,
                                  fechaInio: now,
                                  materia: _materia.text,
                                  grupo: _grupos.text,
                                  horaInicio: timeInitial.hour.toString() +
                                      ':' +
                                      timeInitial.minute.toString(),
                                  horaFinal: timeFinal.hour.toString() +
                                      ':' +
                                      timeFinal.minute.toString()),
                            );
                          },
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
