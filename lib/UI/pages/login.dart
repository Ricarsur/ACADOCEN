import 'package:acadocen/UI/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/background.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

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
                          const TexField(text: 'Nombre'),
                          const SizedBox(height: 20),
                          const TexField(text: 'Contraseña'),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('¿Aún no tienes cuenta?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 106, 106, 106),
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: InkWell(
                                    child: const Text(
                                      'Registrarse',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(104, 118, 253, 1),
                                          decoration: TextDecoration.underline),
                                    ),
                                    onTap: () {
                                      Get.to(() => const Register());
                                    },
                                  )),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Button(text: 'Iniciar sesión'),
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
