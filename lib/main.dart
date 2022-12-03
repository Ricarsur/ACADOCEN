import 'package:acadocen/domain/controller/materia/materia_controller.dart';
import 'package:acadocen/lib.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(ControllerMateria());
  runApp(const App());
}
