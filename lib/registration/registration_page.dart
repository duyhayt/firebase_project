import 'package:firebase_project/modules/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';
import '../common/widgets.dart';
import '../components/app_components.dart';
import '../main.dart';
import '../routes/app_routes.dart';
import '../values/styles/images.dart';
import 'package:nb_utils/nb_utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: ""),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 16),
            color: context.scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                    image: const AssetImage(car),
                    color: appStore.isDarkModeOn ? white : black,
                    height: 110,
                    width: 110),
                Text(
                  "Let's you in",
                  style: boldTextStyle(size: 30),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.login);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                            radius: 14,
                            backgroundImage: const AssetImage(facebook),
                            backgroundColor: context.cardColor),
                        const SizedBox(width: 16),
                        Text('Continue with Facebook', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.login);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                            radius: 12,
                            backgroundImage: const AssetImage(google),
                            backgroundColor: context.cardColor),
                        const SizedBox(width: 16),
                        Text('Continue with Google', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(apple, height: 24, width: 24, color: Colors.blue, fit: BoxFit.cover),
                        const SizedBox(width: 16),
                        Text('Continue with Apple', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 0.2,
                            color: appStore.isDarkModeOn
                                ? white
                                : Colors.grey.withOpacity(0.7))),
                    const SizedBox(width: 10),
                    Text('Or', style: primaryTextStyle()),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            height: 0.2,
                            color: appStore.isDarkModeOn
                                ? white
                                : Colors.grey.withOpacity(0.7)))
                  ],
                ),
                const SizedBox(height: 28),
                GestureDetector(
                  onTap: () {
                  Get.toNamed(Routes.login);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: CircularBlackDecoration,
                    child: Text('Sign in with password',
                        style: boldTextStyle(color: white)),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    Get.toNamed(Routes.signup);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: secondaryTextStyle(),
                      children: [
                        TextSpan(text: ' Sign up', style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
