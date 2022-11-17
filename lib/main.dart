import 'package:flutter/material.dart';
import 'lib.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put<LoginController>(LoginController());
  runApp(const App());
}
