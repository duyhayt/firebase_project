import 'package:firebase_project/modules/home_page/home_page.dart';
import 'package:get/get.dart';

import '../../repository/authentication/authentication_repository.dart';
import '../../routes/app_routes.dart';



class FlashController extends GetxController {


  @override
  void onInit() {
    super.onInit();

    AuthenticationRepository.instance.firebaseUser.value != null ? Get.to(()=>const HomePage()) : Get.offAllNamed(Routes.login);

  }
}