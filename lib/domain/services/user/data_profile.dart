import 'package:acadocen/domain/services/Materia/materia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataProfile {
  //final FirebaseAuth ? user = FirebaseAuth.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<dynamic> dataID = [];

  Future getDataID() async {
    await FirebaseFirestore.instance
        .collection('usuario')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                print(doc.reference.id);
                dataID.add(doc.reference.id);
              })
            });
  }

  Future getData() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future updateData() async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .update({'nombre': 'Pedro'})
        .then((value) => print('User Updated'))
        .catchError((error) => print('Failed to update user: $error'));
  }

  Future addData(DataProfile dataProfile) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .add({'nombre': 'Pedro'})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future insertData(DataProfile dataProfile) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .set({'nombre': 'Pedro'})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future createGroup(String nameGroup) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('grupos')
        .add({'nombre': nameGroup})
        .then((value) => print('Group Added'))
        .catchError((error) => print('Failed to add group: $error'));
  }

  Future guardarMateria(Materia materia) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    await FirebaseFirestore.instance
        .collection('usuario')
        .doc(user.uid)
        .collection('grupos')
        .doc(materia.numberGoup)
        .collection('materias')
        .add({'nombre': materia.nombreCourse})
        .then((value) => print('Materia Added'))
        .catchError((error) => print('Failed to add materia: $error'));
  }
}
