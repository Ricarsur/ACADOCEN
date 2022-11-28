import 'package:acadocen/UI/widgets/card_course.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/services/user/data_profile.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    DataProfile dataProfile = DataProfile();
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
              Text('Listado de Materias',
                  style: TextStyle(fontSize: 22, color: ColorsApp.title)
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              FutureBuilder(
                  future: dataProfile.getMateria(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dataProfile.dataID.length,
                          itemBuilder: (context, index) {
                            return CardCourse(
                              name: dataProfile.dataID[index].nombreCourse
                                  .toString(),
                              onPressed: () {
                                Get.to(() => GroupList(
                                      idCourse: dataProfile
                                          .dataID[index].nombreCourse
                                          .toString(),
                                    ));
                              },
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ]),
          )),
        ),
      ),
    );
  }
}
