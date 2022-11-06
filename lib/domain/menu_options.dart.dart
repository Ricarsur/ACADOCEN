import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final String? title;
  final IconData icon;
  final String route;
  final Widget screen;

  MenuOption({
    this.title,
    required this.icon,
    required this.route,
    required this.screen,
  });
}
