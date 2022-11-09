import 'package:acadocen/domain/services/services.dart';
import 'package:flutter/cupertino.dart';

class ValidationService {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static validateData(nameController,passWordController, context, ruta) {
    if (nameController.text.isEmpty || passWordController.text.isEmpty) {
      Get.snackbar('Error', 'por favor verifique los datos');
    }else {
      Get.toNamed(ruta);
    }
  }

  static void clear() {
    nameController.clear();
  }
}
