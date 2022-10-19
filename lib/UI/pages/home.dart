import 'package:acadocen/domain/controller/navegation_home.dart';
import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  Menu? myMenu;

  @override
  void initState() {
    myMenu = Menu(
      currentIndex: (int i) {
        setState(() {
          this.index = i;
        });
      },
      body: Routes(index: index),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myMenu,
      body: Routes(index: index),
    );
  }
}
