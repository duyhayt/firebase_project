import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final isIconTrue = false.obs;


  final email = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
