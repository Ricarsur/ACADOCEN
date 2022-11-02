import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../misc/colors.dart';
import 'auth/login.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acadocen',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(primary: ColorsApp.gradiant1),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        primaryColor: ColorsApp.gradiant1,
      ),
      // Bugfix
      home: Login(),
    );
  }
}
