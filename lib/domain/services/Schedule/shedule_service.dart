import 'package:flutter/material.dart';

class Horario {
  late final DateTime? seleccionarDia;
  late final TimeOfDay? seleccionarHoraInicial;
  late final TimeOfDay? seleccionarHoraFinal;
  final String? seleccionarMateria;
  final String? seleccionarGrupo;

  Horario({
    this.seleccionarDia,
    this.seleccionarHoraInicial,
    this.seleccionarHoraFinal,
    this.seleccionarMateria,
    this.seleccionarGrupo,
  });
}
