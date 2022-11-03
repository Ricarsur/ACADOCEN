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
  Group(course: 'Hola', name: 'Nombre'),
  Group(course: 'Hola', name: 'Nombre'),
  Group(course: 'Hola', name: 'Nombre')
];
