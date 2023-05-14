import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/user_model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

// Lấy user collection
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

// Get current đang đăng nhập
  late final Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    getUser();
    updateUser();
  }

  Future<void> updateUser() async {}

  Stream<List<UserModel>> getUser() {
    return FirebaseFirestore.instance.collection('Users').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
  }
}
