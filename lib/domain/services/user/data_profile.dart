import 'package:acadocen/domain/controller/controller.dart';
import 'package:acadocen/domain/services/Materia/materia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataProfile {
  //final FirebaseAuth ? user = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<dynamic> dataID = [];

  Future createMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .add({'nombre': materia.nombreCourse})
        .then((value) => print('Group Added'))
        .catchError((error) => print('Failed to add group: $error'));
  }

  Future guardarMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia.nombreCourse)
        .collection('grupos')
        .add({'grupo': materia.numberGoup})
        .then((value) => Get.snackbar('Good', 'Materia Added'))
        .catchError(
            (error) => Get.snackbar('Error', 'Failed to add materia: $error'));
  }
}
