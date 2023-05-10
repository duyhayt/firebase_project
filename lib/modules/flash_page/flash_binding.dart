import 'package:firebase_project/modules/flash_page/flash_controller.dart';
import 'package:get/get.dart';
class FlasBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FlashController());
  }


}