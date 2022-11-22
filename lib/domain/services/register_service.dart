import 'package:acadocen/domain/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterService {
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

  validatePassword(passWordController, confirmPasswordController) {
    if (passWordController.text != confirmPasswordController.text) {
      return 'Las contraseñas no coinciden';
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

  validateDataRegister(nameController, identificacion, rol, correo,
      passWordController, confirmPasswordController, context, ruta) {
    var mensaje;
    mensaje = validateEmpty(nameController, identificacion, rol, correo,
        passWordController, confirmPasswordController, context, ruta);
    if (validateEmpty(nameController, identificacion, rol, correo,
            passWordController, confirmPasswordController, context, ruta) ==
        null) {
      mensaje = validateEmail(correo);
      if (validateEmail(correo) == null) {
        mensaje = validateLengthPassword(passWordController);
        if (validateLengthPassword(passWordController) == null) {
          mensaje =
              validatePassword(passWordController, confirmPasswordController);
          if (validatePassword(passWordController, confirmPasswordController) ==
              null) {
            userVerification(nameController, identificacion, rol, correo,
                passWordController);
          }
        }
      }
    }
    if (mensaje != null) Get.snackbar('Error', mensaje.toString());
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
}
