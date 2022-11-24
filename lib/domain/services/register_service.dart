import 'package:acadocen/domain/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  validateEmpty(nameController, identificacion, rol, correo, passWordController,
      confirmPasswordController, context, ruta) {
    if (nameController.text.isEmpty ||
        passWordController.text.isEmpty ||
        identificacion.text.isEmpty ||
        rol.text.isEmpty ||
        correo.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return 'Todos los campos son obligatorios';
    } else {
      return null;
    }
  }

  registroUsuario(
      nameController, identificacion, rol, correo, passWordController) async {
    try {
      await firebase.collection('usuario').doc().set({
        'nombre': nameController.text,
        'identificacion': identificacion.text,
        'rol': rol.text,
        'correo': correo.text,
        'password': passWordController.text,
      });
    } catch (e) {
      print(e.toString());
    }
    Get.snackbar('Usuario creado', 'Usuario registrado correctamente');
  }

  Future<void> userVerification(
      nameController, identificacion, rol, correo, passWordController) async {
    bool mensaje = false;
    await firebase
        .collection('usuario')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      querySnapshot.docs.forEach(await (doc) {
        if (mensaje == false) {
          if (doc['correo'] == correo.text) {
            mensaje = true;
          }
        }
      });
    });
    if (mensaje == true) {
      Get.snackbar('Error', 'Este correo ya está siendo usado');
    } else {
      await registroUsuario(
          nameController, identificacion, rol, correo, passWordController);
    }
  }

  Future<void> authVerfication(nameController, identificacion, rol, correo,
      passWordController, confirmPasswordController, context, ruta) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: correo.text, password: passWordController.text);
      userVerification(
          nameController, identificacion, rol, correo, passWordController);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Este correo ya está siendo usado');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', 'La contraseña debe tener al menos 6 caracteres');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-verification-code') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-verification-id') {
        Get.snackbar('Error', 'El correo no es valido');
      }
    }
  }
}
