import 'package:acadocen/UI/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/check_box.dart';
import '../widgets/textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double top = 0;
  @override
  Widget build(BuildContext context) {
    top = (MediaQuery.of(context).size.height / 18).toDouble();
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
                    TexField(text: 'Nombre'),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(text: 'Identificación '),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(text: 'Correo'),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(text: 'Contraseña'),
                    SizedBox(
                      height: 30,
                    ),
                    TexField(text: 'Confirmar contraseña'),
                    SizedBox(
                      height: 30,
                    ),
                    CheckBox(
                      text: 'Aceptar términos y condiciones',
                    ),
                    SizedBox(
                      height: 30,
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
              padding: EdgeInsets.only(top: top, left: 30),
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
}
