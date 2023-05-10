import 'package:get/get.dart';

import '../../repository/authentication/authentication_repository.dart';
import '../../routes/app_routes.dart';

class InitScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    AuthenticationRepository.instance.firebaseUser.value != null
        ? Get.toNamed(Routes.home)
        : Get.offAllNamed(Routes.login);
  }
}
