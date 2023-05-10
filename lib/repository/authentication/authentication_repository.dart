import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../datas/exceptions/exception.dart';

class AuthenticationRepository extends GetxService {
  static AuthenticationRepository get instance => Get.find();

  //Variables

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    super.onInit();
    _setInitialScreen;
  }


  @override
  void onReady() {
    // firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {

      print('Co user log thang vao home');
      Get.offAllNamed(Routes.home);
    } else {
      print('Route loginzzzzzzz');
      Get.toNamed(Routes.login);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
