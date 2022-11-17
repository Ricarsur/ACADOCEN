import 'package:acadocen/data/firebase/login_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() {
    Get.showOverlay(
      asyncFunction: () async {
        try {
          await const AuthFirebase().signInWithEmail(
            emailController.text.trim(),
            passwordController.text,
          );
          Get.offNamed('/home');
        } on FirebaseAuthException catch (e) {
          print(e.message ?? e.code);
          //Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
        }
      },
    );
  }
}
