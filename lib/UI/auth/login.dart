import 'package:acadocen/UI/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home.dart';
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
        body: SingleChildScrollView(
            child: BackgroundPage(
                title: 'Acadocen',
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 110,
                    ),
                    Text('Bienvenido de vuelta!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 106, 106, 106),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Column(
                        children: [
                          const TexField(text: 'Nombre'),
                          const SizedBox(height: 20),
                          const TexField(text: 'Contraseña'),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Aún no tienes cuenta?',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 90, 90, 90),
                                fontWeight: FontWeight.w600)),
                        const SizedBox(width: 5),
                        InkWell(
                          child: const Text('Registrarse',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 52, 110, 225),
                                  fontWeight: FontWeight.w600)),
                          onTap: () {
                            Get.to(() => const Register());
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Button(
                        text: 'Iniciar sesión',
                        width: 200,
                        onPressed: () {
                          Get.to(() => const Home());
                        }),
                  ],
                ))));
  }
}
