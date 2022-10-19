import 'package:acadocen/UI/pages/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../misc/colors.dart';
import '../pages/group_list.dart';

class Menu extends StatelessWidget {
  final Widget body;
  final String imagen1;
  final String imagen2;
  const Menu(
      {super.key,
      required this.body,
      required this.imagen1,
      required this.imagen2});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        body: body,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Container(
            width: 200,
            height: 200,
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
            child: const Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Color.fromRGBO(30, 46, 85, 1),
          child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(imagen1),
                      onPressed: () {
                        Get.to(() => const Schedule());
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(imagen2),
                      onPressed: () {
                        Get.to(() => const GroupList());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
