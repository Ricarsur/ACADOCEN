import 'package:acadocen/UI/widgets/widgets.dart';

class ControlUser extends GetxController {
  final Rx<dynamic> _usuario = "Sin registro".obs;
  static Rx<dynamic> _uid = "".obs;
  static Rx<dynamic> _rol = "".obs;
  static Rx<dynamic> _mensaje = "".obs;

  static Rx<dynamic> get uid => _uid.value;
  static Rx<dynamic> get rol => _rol.value;
}
