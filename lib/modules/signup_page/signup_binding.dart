import 'package:firebase_project/modules/signup_page/signup_page_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController);
  }
}
