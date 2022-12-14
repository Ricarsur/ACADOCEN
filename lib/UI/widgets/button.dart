import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:flutter/material.dart';



class Button extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [
                ColorsApp.gradiant1,
                ColorsApp.gradiant2,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              minWidth: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                onPressed();
              }),
        ));
  }
}
