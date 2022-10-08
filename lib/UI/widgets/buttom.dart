import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final double height;
  final double width;
  const CustomButton(
      {required this.inputText, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(inputText),
      ),
    );
  }
}
