import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../datas/exceptions/exception.dart';
import '../../models/user_model/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();
  final isIconTrue = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  late final UserModel userModel;

  void registerUser(String email, String password) {
    createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;
      await db.collection('Users').doc(user?.uid).set({
        'fullName': "",
        'email': user?.email,
        'id': "",
        'role': "",
        'birthDay': "",
        'phone': "",
        'gender': "",
      });
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      Get.snackbar('Error', ex.message);
      throw ex;
    } catch (_) {
      final ex = SignUpEmailAndPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
