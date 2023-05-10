import 'package:firebase_project/modules/flash_page/init_controller.dart';
import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:get/get.dart';
class InitScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
    Get.put(InitScreenController());
  }
}