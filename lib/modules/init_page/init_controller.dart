import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../datas/services/local_storage.dart';
import '../../routes/app_routes.dart';
import '../login_page/login_page_controller.dart';

class InitScreenController extends GetxController {
  LoginController controller = Get.put(LoginController());

  final _auth = FirebaseAuth.instance;
  late bool isWalk;
  late final Rx<User?> firebaseUser;

  @override
  void onInit() async {
    super.onInit();

    isWalk = await LocalStorage.get.read('isFirstLogin') ?? false;
    firebaseUser = Rx<User?>(_auth.currentUser);

    _setInitialScreen;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Future.delayed(const Duration(seconds: 2), () {
        print('Co user log thang vao home');
        Get.offAllNamed(Routes.home);
      });
    } else {
      if (isWalk == false) {
        Get.toNamed(Routes.walkthrough);
      } else {
        Get.toNamed(Routes.login);
        print('Route loginzzzzzzz');
      }
    }
  }
}
