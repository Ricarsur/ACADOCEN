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
  Widget build(BuildContext context) {
    return Scaffold(body: Menu());
  }
}
