import 'package:acadocen/UI/widgets/widgets.dart';
import 'package:acadocen/domain/services/materia/data_profile.dart';
import 'package:acadocen/models/materia.dart';

class ControlCourse extends GetxController {
  DataProfile dataProfile = DataProfile();

  final Rxn<List<Materia>?> _materia = Rxn<List<Materia>>();

  Future<void> getMateria() async {
    final List<Materia>? data = await dataProfile.getMateria();
    _materia.value = data;
  }

  List<Materia>? get getAllMaterias => _materia.value!;

  @override
  void onInit() {
    getAllMaterias;
    super.onInit();
  }
}
