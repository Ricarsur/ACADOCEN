import 'package:acadocen/models/shedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataHorario {
  final FirebaseAuth auth = FirebaseAuth.instance;
  static List<Shedule> dataSchedule = [];

  static Future createSchedule(Shedule horario) async {
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('horario')
        .doc(horario.nombreHorario)
        .set({
      'nombreHorario': horario.nombreHorario,
      'fechaInio': horario.fechaInio,
      'horaInicio': horario.horaInicio,
      'horaFinal': horario.horaFinal,
      'materia': horario.materia,
      'grupo': horario.grupo
    }).then((value) {
      Get.snackbar('Horario', 'Horario creado con exito');
    }).catchError(
            (error) => Get.snackbar('Error', 'Failed to add schedule: $error'));
  }
}
