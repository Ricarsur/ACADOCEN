import 'package:acadocen/UI/auth/auth.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:acadocen/models/materia.dart';

class ControllerMateria extends GetxController {
  final Rxn<List<Materia>> _materia = Rxn<List<Materia>>();

  Future<void> getMateria() async {
    _materia.value = await DataProfile.getMateria();
  }

  Future<void> getGroup(materia) async {
    _materia.value = await DataProfile().getGroup(materia);
  }

  List<Materia>? get materia => _materia.value ?? [];
  List<Materia>? get group_list => _materia.value ?? [];
}
