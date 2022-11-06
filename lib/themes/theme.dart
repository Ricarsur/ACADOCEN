import 'package:acadocen/misc/colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static final primaryColor = ColorsApp.gradiant1;
  static final ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    primaryColor: primaryColor,
  );
}
