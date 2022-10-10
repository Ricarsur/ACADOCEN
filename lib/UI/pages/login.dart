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
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColor(title: 'Acadocen'),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
