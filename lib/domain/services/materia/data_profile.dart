import 'package:acadocen/models/materia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataProfile {
  //final FirebaseAuth ? user = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<Materia> dataID = [];

  @override
  refreshContext() {
    Get.forceAppUpdate();
  }

  Future createMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia.nombreCourse)
        .set({'nombre': materia.nombreCourse}).then((value) {
      print('Group Added');
    }).catchError(
            (error) => Get.snackbar('Error', 'Failed to add group: $error'));
  }

  Future createGroupMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia.uid)
        .collection('grupos')
        .doc(materia.numberGoup)
        .set({'nombre': materia.numberGoup})
        .then((value) => Get.snackbar('Good', 'Group Added'))
        .catchError(
            (error) => Get.snackbar('Error', 'Failed to add group: $error'));
  }

  /*Future guardarMateria(Materia materia) async {
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
  }*/
  Future<dynamic> getMateria() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    dataID.clear();
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .orderBy('nombre')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        dataID.add(Materia(nombreCourse: doc['nombre']));
        print(doc.id);
      });
    });
    return dataID;
  }

  Future verifyMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    bool verify = false;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (verify == false) {
          if (doc['nombre'] == materia.nombreCourse) {
            verify = true;
            print('Ya existe una materia con ese nombre');
          }
        }
      });
      if (verify == false) {
        createMateria(materia);
        Get.snackbar('Good', 'Materia Added');
      } else {
        Get.snackbar('Error', 'Ya existe una materia con ese nombre');
      }
    });
  }

  Future<dynamic> getGroup(String materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    dataID.clear();
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia)
        .collection('grupos')
        .orderBy('nombre')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        dataID.add(Materia(numberGoup: doc['nombre']));
        print(doc.id);
      });
    });
    return dataID;
  }

  deleteMateria(String materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(materia)
        .delete()
        .then((value) {
      Get.snackbar('Materia', 'Materia Eliminada');
    }).catchError((error) =>
            Get.snackbar('Error', 'Failed to delete materia: $error'));
    refreshContext();
  }

  deleteGroup(String course, String group) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('materias')
        .doc(course)
        .collection('grupos')
        .doc(group)
        .delete()
        .then((value) {
      Get.snackbar('Grupo', 'Grupo Eliminado');
    }).catchError(
            (error) => Get.snackbar('Error', 'Failed to delete grupo: $error'));
    refreshContext();
  }
}
