import 'package:get/get.dart';

import 'init_controller.dart';
class InitScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InitScreenController());
  }
}