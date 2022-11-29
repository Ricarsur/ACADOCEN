import 'package:acadocen/models/materia.dart';

class Estudiante {
  final String nombre;
  final String uid;
  final bool? estado;
  final Materia materia;
  Estudiante(
      {required this.nombre,
      required this.uid,
      required this.materia,
      this.estado});
}
