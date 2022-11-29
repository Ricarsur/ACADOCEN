import 'package:acadocen/domain/services/services.dart';
import 'package:acadocen/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterService {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  validateEmpty(Usuario usuario) {
    if (usuario.nombre.isEmpty ||
        usuario.identificacion.isEmpty ||
        usuario.rol.isEmpty ||
        usuario.correo.isEmpty ||
        usuario.password.isEmpty ||
        usuario.confirmPassword.isEmpty) {
      return 'Todos los campos son obligatorios';
    } else {
      return null;
    }
  }

  /*registroUsuario(Usuario usuario) async {
    try {
      await firebase.collection('usuario').doc().set({
        'correo': usuario.correo,
        'identificacion': usuario.identificacion,
        'nombre': usuario.nombre,
        'password': usuario.password,
        'rol': usuario.rol,
      });
    } catch (e) {
      print(e.toString());
    }
    Get.snackbar('Usuario creado', 'Usuario registrado correctamente');
  }*/

  /*Future<void> userVerification(Usuario usuario) async {
    bool mensaje = false;
    await firebase
        .collection('usuario')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      querySnapshot.docs.forEach(await (doc) {
        if (mensaje == false) {
          if (doc['correo'] == usuario.correo) {
            mensaje = true;
          }
        }
      });
    });
    if (mensaje == true) {
      Get.snackbar('Error', 'Este correo ya está siendo usado');
    } else {
      await registroUsuario(usuario);
    }
  }*/

  Future<void> authVerfication(BuildContext context, Usuario user) async {
    var mensaje = validateEmpty(user);
    try {
      if (mensaje == null) {
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            });
        UserCredential userCredentia = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: user.correo, password: user.password);
        await firebase.collection('usuario').doc(userCredentia.user!.uid).set({
          'correo': user.correo,
          'identificacion': user.identificacion,
          'nombre': user.nombre,
          'password': user.password,
          'rol': user.rol,
        });
        Navigator.of(context).pop();
        Get.snackbar(
            'Usuario registrado', 'El usuario se registró correctamente');
      } else {
        Get.snackbar('Error', mensaje);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Este correo ya está siendo usado');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', 'La contraseña debe tener al menos 6 caracteres');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-verification-code') {
        Get.snackbar('Error', 'El correo no es valido');
      } else if (e.code == 'invalid-verification-id') {
        Get.snackbar('Error', 'El correo no es valido');
      }
    }
  }
}
