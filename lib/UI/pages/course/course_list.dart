import 'package:acadocen/UI/widgets/card_course.dart';
import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  void refrescar() {
    Get.forceAppUpdate();
  }

  @override
  Widget build(BuildContext context) {
    DataProfile dataProfile = DataProfile();
    var _query = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Listado de Materias',
                        style: TextStyle(fontSize: 22, color: ColorsApp.title)
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    FutureBuilder(
                        future: DataProfile.getMateria(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: DataProfile.dataID.length,
                                itemBuilder: (context, index) {
                                  return CardCourse(
                                    name: DataProfile.dataID[index].nombreCourse
                                        .toString(),
                                    onPressed: () {
                                      Get.to(() => GroupList(
                                            idCourse: DataProfile
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
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('salir de la aplicación'),
            content: Text('¿Quieres salir de la aplicación?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () => Get.toNamed('/login'),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
