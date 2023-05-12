import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../datas/exceptions/exception.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();
  final isIconTrue = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;
      await _fireStore.collection('Users').doc(user?.uid).set({'fullName': "", 'company': "CMC", 'age': "23", 'address': 'Nghe An'});
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
