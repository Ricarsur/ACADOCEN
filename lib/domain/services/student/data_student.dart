import 'package:acadocen/models/estudiante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class DataStudent {
  List<Estudiante> dataID = [];

  Future createStudent(Estudiante estudiante) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(estudiante.materia.nombreCourse)
        .collection('grupos')
        .doc(estudiante.materia.numberGoup)
        .collection('estudiantes')
        .add({
          'uid': user.uid,
          'nombre': estudiante.nombre,
          'materia:': estudiante.materia.nombreCourse,
          'grupo': estudiante.materia.numberGoup
        })
        .then((value) => Get.snackbar('Good', 'Student Added'))
        .catchError(
            (error) => Get.snackbar('Error', 'Failed to add student: $error'));
  }
}
