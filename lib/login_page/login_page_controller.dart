import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

enum FormType { login, register }

class LoginController extends GetxController {
  // String? email;
  // String? password;
  // FormType _formType = FormType.login;
  //
  // bool validationAndSave() {
  //   final form = formKey.currentState;
  //
  //   if (form!.validate()) {
  //     form.save(); //save form de nhan duoc email va password
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  // Future<void> validateAndSubmit() async {
  //   if (validationAndSave()) {
  //     try {
  //       if (_formType == FormType.login) {
  //         UserCredential user = await FirebaseAuth.instance
  //             .signInWithEmailAndPassword(
  //                 email: email.toString(), password: password.toString());
  //
  //         print('Signed in: ${user.user?.uid}');
  //
  //         Get.toNamed(Routes.home);
  //       } else {
  //         UserCredential user = await FirebaseAuth.instance
  //             .createUserWithEmailAndPassword(
  //                 email: email.toString(), password: password.toString());
  //         print('Register user: ${user.user}');
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         Get.snackbar('Error', 'No user found for that email.');
  //       } else if (e.code == 'wrong-password') {
  //         print('Wrong password provided for that user.');
  //       }
  //     }
  //   }
  // }
  //
  // void moveToRegister() {
  //   formKey.currentState?.reset();
  //   setState(() {
  //     _formType = FormType.register;
  //   });
  // }
  //
  // void moveToLogin() {
  //   formKey.currentState?.reset();
  //   setState(() {
  //     _formType = FormType.login.obs;
  //   });
  // }
  //
  // List<Widget> buildSubmitButtons() {
  //   if (_formType == FormType.login) {
  //     return [
  //       ElevatedButton(
  //           onPressed: validateAndSubmit, child: const Text('Login')),
  //       ElevatedButton(
  //           onPressed: moveToRegister, child: const Text('Create Account')),
  //     ];
  //   } else {
  //     return [
  //       ElevatedButton(
  //           onPressed: validateAndSubmit, child: const Text('Create Account')),
  //       ElevatedButton(
  //           onPressed: moveToLogin,
  //           child: const Text('Have an Account? Login?')),
  //     ];
  //   }
  // }
}
