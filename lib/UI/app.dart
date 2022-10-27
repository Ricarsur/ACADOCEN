import 'package:acadocen/UI/widgets/attendance_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const AttendanceList(students: [
        {
          'name': 'Juan',
          'email': 'arafaelaraujo@unicesae.edu.co',
        },
      ]),
    );
  }
}
