import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../misc/colors.dart';

class Menu extends StatefulWidget {
  final Function currentIndex;
  final Widget body;
  const Menu({super.key, required this.currentIndex, required this.body});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String imagen1 = 'assets/svg/iconHome.svg';
  String imagen2 = 'assets/svg/IconPersons.svg';

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.body,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Hola');
          },
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
                        setState(() {
                          index = 0;
                          widget.currentIndex(0);
                          imagen1 = 'assets/svg/iconHome.svg';
                          imagen2 = 'assets/svg/IconPersons.svg';
                        });
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(imagen2),
                      onPressed: () {
                        setState(() {
                          index = 1;
                          widget.currentIndex(1);
                          imagen1 = 'assets/svg/iconHome2.svg';
                          imagen2 = 'assets/svg/IconPersons2.svg';
                        });
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


/*onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },*/