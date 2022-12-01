import 'package:acadocen/UI/auth/auth.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:acadocen/models/materia.dart';

class ControllerMateria extends GetxController {
  DataProfile dataProfile = DataProfile();
  final Rxn<List<Materia>> _materia = Rxn<List<Materia>>();

  Future<void> getMateria() async {
    _materia.value = await dataProfile.getMateria();
  }

  List<Materia>? get materia => _materia.value ?? [];
}
