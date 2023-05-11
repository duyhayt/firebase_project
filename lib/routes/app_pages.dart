import 'package:firebase_project/modules/home_page/home_binding.dart';
import 'package:firebase_project/modules/home_page/home_page.dart';
import 'package:firebase_project/modules/login_page/login_binding.dart';
import 'package:firebase_project/modules/profile_page/profile_binding.dart';
import 'package:firebase_project/modules/signup_page/signup_binding.dart';
import 'package:firebase_project/modules/walkthrough/walkthrough_page.dart';
import 'package:firebase_project/registration/registration_binding.dart';
import 'package:get/get.dart';
import '../modules/fragments/setting_page/setting_binding.dart';
import '../modules/fragments/setting_page/setting_page.dart';
import '../modules/init_page/init_binding.dart';
import '../modules/init_page/init_page.dart';
import '../modules/login_page/login_page.dart';
import '../modules/profile_page/profile_page.dart';
import '../modules/signup_page/signup_page.dart';
import '../modules/walkthrough/walkthrough_binding.dart';
import '../registration/registration_page.dart';
import 'app_routes.dart';

class AppPages {
  static const duration = 500;
  static final pages = [
    GetPage(
      name: Routes.initPage,
      page: () => const InitScreen(),
      binding: InitScreenBinding(),
      transitionDuration: const Duration(microseconds: duration),
    ),
    GetPage(
      name: Routes.walkthrough,
      page: () => const WalkThroughScreen(),
      binding: WalkthroughBinding(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight)
    ,
    GetPage(
        name: Routes.setting,
        page: () => const SettingPage(),
        binding: SettingBinding(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.registration,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.dashboard,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight),

    GetPage(
        name: Routes.profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding(),
        transitionDuration: const Duration(milliseconds: duration),
        transition: Transition.leftToRight),
  ];
}
