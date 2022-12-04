import 'package:acadocen/lib.dart';
import 'package:acadocen/models/estudiante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class DataStudent {
  List<dynamic> dataStudent = [];

  Future createStudent(String grupo, DateTime fecha, String materia,
      List<Estudiante> list) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    list.forEach((element) async {
      await FirebaseFirestore.instance
          .collection('usuario')
          .doc(user.uid)
          .collection('materias')
          .doc(materia)
          .collection('grupos')
          .doc(grupo)
          .collection('asistencia')
          .doc(fecha.toString())
          .collection('estudiante')
          .add({
        'nombre': element.nombre,
        'identificacion': element.uid,
        'fecha': fecha,
      }).then((value) {
        print('Student Added');
      }).catchError((error) =>
              Get.snackbar('Error', 'Failed to add student: $error'));
    });
  }

  Future createAttendance(String grupo, DateTime fecha, String materia,
      List<Estudiante> list) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia)
        .collection('grupos')
        .doc(grupo)
        .collection('asistencia')
        .doc(fecha.toString())
        .set({
      'nombre': fecha.toString(),
      'grupo': grupo,
      'materia': materia
    }).then((value) {
      Get.snackbar('Good', 'Asistencia agregada');
      createStudent(grupo, fecha, materia, list);
    });
  }
}
