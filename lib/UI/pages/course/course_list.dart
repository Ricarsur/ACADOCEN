import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/card_course.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Listado de cursos',
                  style: TextStyle(fontSize: 22, color: ColorsApp.title)
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              CardCourse(
                name: 'Matemáticas',
                onPressed: () {
                  Get.to(() => const GroupList());
                },
              )
            ]),
          )),
        ),
      ),
    );
  }
}
