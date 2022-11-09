import 'package:acadocen/UI/auth/auth.dart';
import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: [
        BackgroundPage(
          title: 'Acadocen',
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TexField(text: 'Nombre', type: TextInputType.text),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(
                        text: 'Identificación', type: TextInputType.number),
                    SizedBox(
                      height: 30,
                    ),
                    Combobox(
                      title: 'Selecciona tu rol',
                      list: ['Estudiante', 'Profesor'],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(text: 'Correo', type: TextInputType.emailAddress),
                    SizedBox(
                      height: 30,
                    ),
                    passwordField('Contraseña'),
                    SizedBox(
                      height: 30,
                    ),
                    passwordField('Confirmar contraseña'),
                    SizedBox(
                      height: 30,
                    ),
                    CheckBox(
                      text: 'Aceptar términos y condiciones',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      text: 'Registrarse',
                      width: 200,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ])),
    );
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
            child: const TextField(
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
