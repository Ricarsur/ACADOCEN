import 'package:acadocen/UI/ui.dart';
import 'package:acadocen/routes/app_routes.dart';
import 'package:acadocen/themes/theme.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acadocen',
      theme: ThemeApp.themeLight,
      initialRoute: AppRoutes.loading,
      getPages: AppRoutes.all,
    );
  }
}
