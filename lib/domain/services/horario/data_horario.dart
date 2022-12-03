import 'package:acadocen/models/shedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataHorario {
  refreshContext() {
    Get.forceAppUpdate();
  }

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
      'fecha': horario.fechaInio,
      'horaInicio': horario.horaInicio,
      'horaFinal': horario.horaFinal,
      'materia': horario.materia,
      'grupo': horario.grupo
    }).then((value) {
      Get.snackbar('Horario', 'Horario creado con exito');
    }).catchError(
            (error) => Get.snackbar('Error', 'Failed to add schedule: $error'));
  }

  static Future<List<Shedule>> getShedule(DateTime fecha) async {
    dataSchedule.clear();
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('horario')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['fecha'].toDate().day == fecha.day) {
          dataSchedule.add(Shedule(
              nombreHorario: doc['nombreHorario'],
              fechaInio: doc['fecha'].toDate(),
              horaInicio: doc['horaInicio'],
              horaFinal: doc['horaFinal'],
              materia: doc['materia'],
              grupo: doc['grupo']));
        }
        print(doc);
      });
    });
    return dataSchedule;
  }

  deleteSchedule(String nombreSchedule) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('horario')
        .doc(nombreSchedule)
        .delete()
        .then((value) {
      Get.snackbar('Horario', 'Horario eliminado');
    }).catchError((error) =>
            Get.snackbar('Error', 'Failed to delete horario: $error'));
    refreshContext();
  }
}
