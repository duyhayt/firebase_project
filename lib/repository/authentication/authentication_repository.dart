import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/modules/login_page/login_page_controller.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../datas/services/local_storage.dart';

class AuthenticationRepository extends GetxService {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
