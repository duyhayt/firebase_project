import 'package:firebase_project/home_page.dart';
import 'package:firebase_project/login_page/login_page.dart';
import 'package:firebase_project/signup_page/signup_page.dart';
import 'package:firebase_project/welcome/welcome_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const duration = 500;
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      transitionDuration: const Duration(milliseconds: duration),
    ),GetPage(
      name: Routes.signup,
      page: () => const SignUpPage(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight)
  ];
}
