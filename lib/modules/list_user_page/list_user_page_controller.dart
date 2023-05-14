import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/user_test_crud_model.dart';

class ListUserController extends GetxController {
  static ListUserController get instance => Get.find();

  // final db = FirebaseFirestore.instance;

// Lấy list user trong collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');
}
