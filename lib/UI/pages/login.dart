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
              padding: const EdgeInsets.only(top: 140),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 30, 130, 20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 130,
                    ),
                  ),
                  const Text('Bienvenido de vuelta!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 106, 106, 106),
                          fontWeight: FontWeight.bold)),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(60, 60, 60, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nombre',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 52, 52, 52),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromRGBO(232, 232, 232, 0.6),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 24.0, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF1488CC),
                                        Color(0xFF2B32B2),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: Center(
                                  child: MaterialButton(
                                      minWidth: 500,
                                      height: 56,
                                      child: const Text(
                                        "Iniciar sesión",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {}),
                                )),
                          ),
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
