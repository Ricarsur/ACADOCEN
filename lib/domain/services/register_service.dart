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
      Get.snackbar('Error', 'por favor verifique los datos');
    } else {
      return null;
    }
  }

  validatePassword(passWordController, confirmPasswordController, context) {
    if (passWordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Las contraseñas no coinciden');
    } else {
      return null;
    }
  }

  validateEmail(correo, context) {
    if (!GetUtils.isEmail(correo.text)) {
      Get.snackbar('Error', 'El correo no es valido');
    } else {
      return null;
    }
  }

  validateLengthPassword(passWordController, context) {
    if (passWordController.text.length < 6) {
      Get.snackbar('Error', 'La contraseña debe tener al menos 6 caracteres');
    } else {
      return null;
    }
  }

  validateDataRegister(nameController, identificacion, rol, correo,
      passWordController, confirmPasswordController, context, ruta) {
    if (validateEmpty(nameController, identificacion, rol, correo,
                passWordController, confirmPasswordController, context, ruta) ==
            null &&
        validatePassword(
                passWordController, confirmPasswordController, context) ==
            null &&
        validateEmail(correo, context) == null &&
        validateLengthPassword(passWordController, context) == null) {
      registroUsuario(
          nameController, identificacion, rol, correo, passWordController);
    }
  }
/*else {
      registroUsuario(
          nameController, identificacion, rol, correo, passWordController);
      //Get.toNamed(ruta);
    } */

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
  }
}
