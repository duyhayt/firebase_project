import 'package:firebase_project/modules/list_user_page/list_user_page_controller.dart';
import 'package:get/get.dart';

class ListUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListUserController());
  }
}
