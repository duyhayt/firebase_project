import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/datas/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final formKey = GlobalKey<FormState>();
  LocalStorage storage = LocalStorageImpl();

  final showPass = false.obs;
  final isFirstLogin = false.obs;
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
        isFirstLogin.value = true;
        storage.writeData(key: 'isFirstLogin', data: true);
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
