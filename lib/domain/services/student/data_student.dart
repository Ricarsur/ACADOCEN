import 'package:acadocen/lib.dart';
import 'package:acadocen/models/estudiante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class DataStudent {
  List<dynamic> dataStudent = [];
  List<dynamic> dataStudents = [];
  refreshContext() {
    Get.forceAppUpdate();
  }

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
          .doc(DateFormat('EEEE, MMM d, yyyy').format(fecha))
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
        .doc(DateFormat('EEEE, MMM d, yyyy').format(fecha))
        .set({
      'nombre': DateFormat('EEEE, MMM d, yyyy').format(fecha),
      'grupo': grupo,
      'materia': materia
    }).then((value) {
      Get.snackbar('Good', 'Asistencia agregada');
      createStudent(grupo, fecha, materia, list);
    });
  }

  Future<dynamic> getAttendence(String grupo, String materia) async {
    print(materia);
    print(grupo);
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
        .collection('asistencia')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        dataStudent.add(doc['nombre']);
        print(doc['nombre']);
      });
    });

    return dataStudent;
  }

  deleteAttendance(String grupo, String materia, String nombre) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
      ..collection('usuario')
          .doc(user.uid)
          .collection('materias')
          .doc(materia)
          .collection('grupos')
          .doc(grupo)
          .collection('asistencia')
          .doc(nombre)
          .delete()
          .then((value) {
        Get.snackbar('Asistencia', 'Asistencia Eliminada');
      }).catchError((error) =>
              Get.snackbar('Error', 'Failed to delete materia: $error'));
    refreshContext();
  }
}
