import 'package:acadocen/UI/ui.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String home = '/home';
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (final i in menuOptions) {
      routes.addAll({i.route: (BuildContext context) => i.screen});
    }
    return routes;
  }

  static final menuOptions = <MenuOption>[
    MenuOption(
      icon: Icons.home,
      route: home,
      screen: Home(),
    )
  ];
}
