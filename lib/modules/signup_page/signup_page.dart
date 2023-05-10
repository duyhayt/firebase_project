import 'package:firebase_project/modules/signup_page/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/widgets.dart';
import '../../main.dart';
import '../../routes/app_routes.dart';
import '../../values/styles/colors.dart';
import '../../values/styles/images.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: careaAppBarWidget(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Image(height: 110, width: 110, fit: BoxFit.cover, image: AssetImage(car), color: Colors.blue),
                  const SizedBox(height: 16),
                  Text('Create Your Account', style: boldTextStyle(size: 24)),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: controller.email,
                    autofillHints: const [AutofillHints.email],
                    decoration: inputDecoration(context, prefixIcon: Icons.mail_rounded, hintText: "Email"),
                  ),
                  const SizedBox(height: 20),

                  Obx( () =>
                     TextFormField(
                      controller: controller.password,
                      obscureText: controller.isIconTrue.value,

                      decoration: inputDecoration(
                        context,
                        prefixIcon: Icons.lock,
                        hintText: "Password",
                        suffixIcon: Theme(
                          data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
                          child: IconButton(
                            highlightColor: Colors.transparent,
                            onPressed: () {

                                controller.isIconTrue.value = !controller.isIconTrue.value;

                            },
                            icon: Icon(
                              (controller.isIconTrue.value) ? Icons.visibility_rounded : Icons.visibility_off,
                              size: 16,
                              color: appStore.isDarkModeOn ? white : gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: const BorderRadius.all(Radius.circular(45)),
                        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : black,
                      ),
                      child: Text('Sign Up', style: boldTextStyle(color: white)),
                    ),
                  ),
                  //Divider
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(child: Container(height: 0.2, color: Colors.black)),
                          const SizedBox(width: 10),
                          const Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Container(height: 0.2, color: primaryBlackColor)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await customDialoge(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color:  Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Image(height: 24, width: 24, image: AssetImage(facebook)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await customDialoge(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Image(height: 24, width: 24, image: AssetImage(google)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await customDialoge(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Image(height: 24, width: 24, image: AssetImage(apple), color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have account? ",
                        style: secondaryTextStyle(),
                        children: [
                          TextSpan(text: ' Sign in', style: primaryTextStyle()),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
