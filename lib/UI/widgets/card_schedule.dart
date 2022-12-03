import 'package:acadocen/domain/services/horario/data_horario.dart';
import 'package:flutter/material.dart';

import '../../misc/colors.dart';

class CardSchedule extends StatelessWidget {
  final String nombreHorario;
  final String grupo;
  final String horaInicio;
  final String horaFinal;
  const CardSchedule(
      {super.key,
      required this.nombreHorario,
      required this.grupo,
      required this.horaInicio,
      required this.horaFinal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onLongPress: () {
          _eliminar(context, nombreHorario);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: ColorsApp.gradiant1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    nombreHorario,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(grupo, style: TextStyle(color: Colors.white))
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Hora de inicio: ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: horaInicio,
                        style: TextStyle(color: Colors.white)),
                  ])),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Hora final: ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: horaFinal, style: TextStyle(color: Colors.white)),
                  ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _eliminar(context, String nombre) {
    DataHorario dataHorario = DataHorario();
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Horario'),
              content: Text('Realmente desea eliminar ${grupo}'),
              actions: [
                TextButton(
                    onPressed: () {
                      dataHorario.deleteSchedule(nombre);
                      Navigator.pop(context);
                      build(context);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }
}
