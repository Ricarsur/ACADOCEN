import 'package:acadocen/models/materia.dart';

class Estudiante {
  final String nombre;
  final String uid;
  Materia materia;
  Estudiante({required this.nombre, required this.uid, required this.materia});
}
