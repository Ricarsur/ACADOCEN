import 'package:acadocen/UI/widgets/check_box.dart';
import 'package:acadocen/UI/widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackgroundColor(title: 'Acadocen'),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 34, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(60, 150, 60, 0),
            child: Column(children: const [
              TexField(
                text: 'Nombre',
              ),
              SizedBox(height: 20),
              TexField(
                text: 'Identificación ',
              ),
              SizedBox(height: 20),
              TexField(
                text: 'Rol',
              ),
              SizedBox(height: 20),
              TexField(
                text: 'Correo',
              ),
              SizedBox(height: 20),
              TexField(
                text: 'Contraseña',
              ),
              SizedBox(height: 20),
              TexField(
                text: 'Confirmar contraseña',
              ),
              SizedBox(height: 10),
              CheckBox(
                text: 'Aceptar términos y condiciones',
              ),
              SizedBox(height: 20),
              Button(text: 'Iniciar sesión'),
            ])),
      ],
    ));
  }
}
