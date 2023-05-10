import 'package:firebase_project/modules/flash_page/init_binding.dart';
import 'package:firebase_project/modules/home_page/home_page.dart';
import 'package:firebase_project/modules/flash_page/init_page.dart';
import 'package:firebase_project/modules/setting_page/setting_page.dart';
import 'package:get/get.dart';
import '../modules/login_page/login_page.dart';
import '../modules/signup_page/signup_page.dart';
import 'app_routes.dart';

class AppPages {
  static const duration = 500;
  static final pages = [
    GetPage(
      name: Routes.initPage,
      page: () => const InitScreen(),
      binding: InitScreenBinding(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpPage(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight)
    ,
    GetPage(
        name: Routes.setting,
        page: () => const SettingPage(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight)
  ];
}
