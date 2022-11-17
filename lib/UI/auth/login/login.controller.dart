import 'package:acadocen/domain/controller/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  LoginController();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) Get.offAllNamed('/login');
    });
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;
}
