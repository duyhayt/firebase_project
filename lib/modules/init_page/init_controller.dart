import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../datas/services/local_storage.dart';
import '../../routes/app_routes.dart';

class InitScreenController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late bool isWalk;
  late final Rx<User?> firebaseUser;

  @override
  void onInit() async {
    super.onInit();

    if (await LocalStorage.get.read('isFirstLogin') ?? false) {
      isWalk = false;
    } else {
      isWalk = true;
    }
    firebaseUser = Rx<User?>(_auth.currentUser);

    _setInitialScreen;
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Future.delayed(const Duration(seconds: 2), () {
        print('Have user!');
        Get.offAllNamed(Routes.home);
      });
    } else {
      if (isWalk == false) {
        print('isWalk == false ');
        Get.toNamed(Routes.walkthrough);
      } else {
        Get.toNamed(Routes.login);
        print('isWalk == true');
      }
    }
  }
}
