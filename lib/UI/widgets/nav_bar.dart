// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acadocen/UI/pages/new%20schedule.dart';
import 'package:acadocen/UI/pages/new_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:acadocen/UI/pages/group_list.dart';
import 'package:acadocen/UI/pages/schedule.dart';
import 'package:get/get.dart';

import '../../misc/colors.dart';

class Menu extends StatefulWidget {
  final VoidCallback onPressed;
  const Menu({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentTab = 0;
  final List<Widget> screens = [Schedule(), GroupList()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Schedule();
  String imagen1 = 'assets/svg/iconHome.svg';
  String imagen2 = 'assets/svg/IconPersons.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorsApp.gradiant1,
              ColorsApp.gradiant2,
            ],
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.add),
          onPressed: () {
            if (currentTab == 0) {
              Get.to(() => const NewSchedule());
            } else {
              Get.to(() => const NewGroup());
            }
            widget.onPressed();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Color.fromRGBO(30, 46, 85, 1),
        child: Container(
          height: 53,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Schedule();
                          currentTab = 0;
                          imagen1 = 'assets/svg/iconHome.svg';
                          imagen2 = 'assets/svg/IconPersons.svg';
                        });
                      },
                      child: SvgPicture.asset(imagen1, width: 26, height: 26),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = GroupList();
                          currentTab = 1;
                          imagen1 = 'assets/svg/iconHome2.svg';
                          imagen2 = 'assets/svg/IconPersons2.svg';
                        });
                      },
                      child: SvgPicture.asset(imagen2, width: 26, height: 26),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },*/
