import 'package:acadocen/lib.dart';
import 'package:acadocen/models/estudiante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class DataStudent {
  List<dynamic> dataStudent = [];

  Future createStudent(Estudiante estudiante) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(estudiante.materia.nombreCourse)
        .collection('grupos')
        .doc(estudiante.materia.numberGroup)
        .collection('estudiantes')
        .add({
          'uid': user.uid,
          'nombre': estudiante.nombre,
          'materia': estudiante.materia.nombreCourse,
          'grupo': estudiante.materia.numberGroup,
          'estado': estudiante.estado ?? false,
        })
        .then((value) => Get.snackbar('Good', 'Student Added'))
        .catchError(
            (error) => Get.snackbar('Error', 'Failed to add student: $error'));
  }

  Future<dynamic> getStudent(String materia, String grupo) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    dataStudent.clear();
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia)
        .collection('grupos')
        .doc(grupo)
        .collection('estudiantes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        dataStudent.add(doc['nombre']);
        print(doc['nombre']);
      });
    });
    return dataStudent;
  }
}
