import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
  }
}
