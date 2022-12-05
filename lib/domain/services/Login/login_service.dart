import 'package:acadocen/UI/widgets/background_loading.dart';
import 'package:acadocen/domain/services/services.dart';
import 'package:acadocen/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Future<void> userVerification(BuildContext context, Usuario usuario) async {
    showDialog(
        context: context,
        builder: (context) {
          return BackgroundLoading(ruta: '');
        });
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
              Navigator.of(context).pop();
              Get.toNamed('/home');
              mensaje = true;
            } else {
              Navigator.of(context).pop();
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

  Future<void> authVerfication(BuildContext context, Usuario usuario) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuario.correo, password: usuario.password);
      if (userCredential.user != null) {
        userVerification(context, usuario);
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
