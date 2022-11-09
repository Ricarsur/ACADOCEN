// ignore_for_file: public_member_api_docs, sort_constructors_first
class Group {
  var course;
  var name;
  Group({
    required this.course,
    required this.name,
  });
}

List<Group> listGroup = [
  Group(course: 'Base de datos', name: 'grupo 03'),
  Group(course: 'POOIII', name: 'grupo 02'),
  Group(course: 'Algebra Lineal', name: 'grupo 01')
];
