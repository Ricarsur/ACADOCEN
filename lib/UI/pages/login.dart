import 'package:flutter/material.dart';

import '../widgets/background.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundColor(
        title: 'Acadocen',
      ),
    );
  }
}
