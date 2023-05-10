import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final formKey = GlobalKey<FormState>();


  final showPass = false.obs;

  final checkBoxValue = false.obs;
  String? email;
  String? password;

  bool validationAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save(); //save form de nhan duoc email va password
      return true;
    } else {
      return false;
    }
  }

  Future<void> validateAndSubmit() async {
    if (validationAndSave()) {
      try {
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.toString(), password: password.toString());

        print('Signed in: ${user.user?.uid}');

        Get.toNamed(Routes.home);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Error', 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
