import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model/user_model.dart';

class ProfileController extends GetxController {
  final db = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  late final CollectionReference userCollection = db.collection('Users');

// User? user;
//
// late final CollectionReference userCollection = db.collection('Users');
// late final DocumentReference documentReference = userCollection.doc('email');
//
// Future<void> getUser() async {
//
// }
//
// Future<void> updateUser(UserModel userModel) async {
//   try {
//     await documentReference.update({
//       'fullName': userModel.fullName,
//       'role': userModel.role,
//     });
//     update();
//   } catch (e) {
//     print(e);
//   }
// }
}
