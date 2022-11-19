import 'package:acadocen/UI/auth/auth.dart';
import 'package:acadocen/domain/services/login_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                          TexField(
                            text: 'Nombre de usuario',
                            type: TextInputType.text,
                            controllerText: _nameController,
                          ),
                          const SizedBox(height: 20),
                          passwordField('Contraseña'),
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
                          LoginService.validateData(_nameController,
                              _passwordController, context, '/home');
                        }),
                  ],
                ))));
  }

  Widget passwordField(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 80, 80, 80),
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
