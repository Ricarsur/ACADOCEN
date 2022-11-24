import 'package:acadocen/domain/services/services.dart';
import 'package:acadocen/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
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

  Future<void> userVerification(Usuario usuario) async {
    bool mensaje = false;
    String identificacion = '';
    await firebase
        .collection('usuario')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      querySnapshot.docs.forEach(await (doc) {
        if (mensaje == false) {
          if (doc['correo'] == usuario.correo &&
              doc['password'] == usuario.password) {
            if (doc['rol'] == 'Profesor') {
              Get.toNamed('/home');
              mensaje = true;
            } else {
              identificacion = doc['identificacion'];
              Get.toNamed('/qr', arguments: identificacion);
              mensaje = true;
            }
          }
        }
      });
    });
    if (mensaje == false) {
      Get.snackbar('Error', 'Usuario o contraseña incorrectos');
    }
  }

  /*validateDataLogin(nameController, identificacion, rol, correo,
      passWordController, confirmPasswordController, context, ruta) async {
    if (validateEmpty(nameController, identificacion, rol, correo,
            passWordController, confirmPasswordController, context, ruta) ==
        null) {
      if (validateEmail(correo) == null) {
        if (validateLengthPassword(passWordController) == null) {
          await userVerification(nameController, passwordController);
        }
      }
    }
  }*/

  Future<void> userVerfication(Usuario usuario) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuario.correo, password: usuario.password);
      if (userCredential.user != null) {
        userVerification(usuario);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'Usuario no encontrado');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Contraseña incorrecta');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'Correo invalido');
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', 'La contraseña debe tener al menos 6 caracteres');
      }
    }
  }
}
