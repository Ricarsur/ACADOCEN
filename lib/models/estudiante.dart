import 'package:acadocen/models/materia.dart';

class Estudiante {
  final String nombre;
  final String uid;
  final Materia materia;
  Estudiante({
    required this.nombre,
    required this.uid,
    required this.materia,
  });
}

List<Estudiante> prueba = [
  Estudiante(
      nombre: 'Juan',
      uid: '123',
      materia: Materia(nombreCourse: 'Matematicas')),
  Estudiante(
      nombre: 'Pedro',
      uid: '123',
      materia: Materia(nombreCourse: 'Matematicas')),
  Estudiante(
      nombre: 'rojelio',
      uid: '123',
      materia: Materia(nombreCourse: 'Matematicas')),
];
