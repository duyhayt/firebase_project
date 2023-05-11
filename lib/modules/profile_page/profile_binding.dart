import 'package:firebase_project/modules/profile_page/profile_controller.dart';
import 'package:get/get.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }


}