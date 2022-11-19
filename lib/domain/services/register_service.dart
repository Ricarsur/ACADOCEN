import 'package:acadocen/domain/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterService {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  validateData(nameController, identificacion, rol, correo, passWordController,
      context, ruta) {
    if (nameController.text.isEmpty ||
        passWordController.text.isEmpty ||
        identificacion.text.isEmpty ||
        rol.text.isEmpty ||
        correo.text.isEmpty) {
      Get.snackbar('Error', 'por favor verifique los datos');
    } else {
      registroUsuario(
          nameController, identificacion, rol, correo, passWordController);
      //Get.toNamed(ruta);
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
  }
}
