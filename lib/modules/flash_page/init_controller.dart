import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../datas/services/local_storage.dart';
import '../../repository/authentication/authentication_repository.dart';
import '../../routes/app_routes.dart';
import '../login_page/login_page_controller.dart';

class InitScreenController extends GetxController {
  final LocalStorage storage = LocalStorageImpl();
  LoginController controller = Get.put(LoginController());

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(_auth.currentUser);

    super.onInit();
    _setInitialScreen;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      await Future.delayed(const Duration(seconds: 2), () {
        print('Co user log thang vao home');
        Get.offAllNamed(Routes.home);
      });
    } else {
      if (controller.isFirstLogin.value == false) {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          Get.toNamed(Routes.walkthrough);
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          Get.toNamed(Routes.login);
          print('Route loginzzzzzzz');
        });
      }
    }
  }
}
