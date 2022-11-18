import 'package:acadocen/UI/ui.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String login = '/login';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: login,
      screen: Login(),
    ),
    MenuOption(
      route: '/home',
      screen: Home(),
    )
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (final i in menuOptions) {
      routes.addAll({i.route: (BuildContext context) => i.screen});
    }
    return routes;
  }

  static Map<String, Widget Function(BuildContext)> route = {
    '/login': (BuildContext context) => Login(),
    '/home': (BuildContext context) => Home(),
  };
}
