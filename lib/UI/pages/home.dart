import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: showExitPopup,
      child: Menu(
        onPressed: () {},
      ),
    ));
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
                    primary: Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
