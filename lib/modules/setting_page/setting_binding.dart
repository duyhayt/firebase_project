import 'package:firebase_project/modules/setting_page/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
