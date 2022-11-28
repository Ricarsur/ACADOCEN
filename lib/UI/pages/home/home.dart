import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int currentTab;
  const Home({super.key, required this.currentTab});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Menu(
      pagina: widget.currentTab,
      onPressed: () {},
    ));
  }
}
