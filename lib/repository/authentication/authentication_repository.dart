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
  }
  @override
  void onReady() {
    // firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  // Future<void> createUserWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = SignUpEmailAndPasswordFailure.code(e.code);
  //     Get.snackbar('Error', ex.message);
  //     throw ex;
  //   } catch (_) {
  //     final ex = SignUpEmailAndPasswordFailure();
  //     print('Exception - ${ex.message}');
  //     throw ex;
  //   }
  // }
  //
  // Future<void> logout() async {
  //   await _auth.signOut();
  // }
}
