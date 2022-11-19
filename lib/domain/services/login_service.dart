import 'package:acadocen/domain/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class LoginService {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

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

  validateEmail(correo) {
    if (!GetUtils.isEmail(correo.text)) {
      return 'El correo no es valido';
    } else {
      return null;
    }
  }

  validateLengthPassword(passWordController) {
    if (passWordController.text.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    } else {
      return null;
    }
  }

  Future<void> userVerification(nameController, passwordController) async {
    await firebase
        .collection('usuario')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['correo'] == nameController.text &&
            doc['password'] == passwordController.text) {
          if (doc['rol'] == 'Profesor') {
            Get.toNamed('/home');
          } else {
            Get.toNamed('/qr');
          }
        } else {
          Get.snackbar('Error', 'Usuario o contraseña incorrectos');
        }
      });
    });
  }

  validateDataLogin(nameController, identificacion, rol, correo,
      passWordController, confirmPasswordController, context, ruta) {
    if (validateEmpty(nameController, identificacion, rol, correo,
            passWordController, confirmPasswordController, context, ruta) ==
        null) {
      if (validateEmail(correo) == null) {
        if (validateLengthPassword(passWordController) == null) {
          userVerification(nameController, passwordController);
        }
      }
    }
  }
}
