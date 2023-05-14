import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/user_test_crud_model.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final db = FirebaseFirestore.instance;

  final name = TextEditingController();
  final age = TextEditingController();
  final address = TextEditingController();

// Tạo 1 mới 1 user trong collection users
  /// Chú ý: Lúc tạo và gửi lên Firestore thì mình sẽ gửi dữ liệu dạng Map<String, dynamic>
  Future createUser(String name, int age, String address) async {
    final docUser = db.collection('users').doc();
    final data = {
      'id': docUser.id,
      'name': name,
      'age': age,
      'address': address,
    };
    await docUser.set(data);
  }
}
