import 'package:firebase_project/modules/login_page/login_page_controller.dart';
import 'package:firebase_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/widgets.dart';
import '../../main.dart';
import '../../values/styles/images.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).unfocus();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(elevation: 0, iconTheme: const IconThemeData(color: Colors.blue)),
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(height: 130, width: 130, fit: BoxFit.contain, image: AssetImage(logo_en), color: Colors.black),
                      Text('Login to Your Account', style: boldTextStyle(size: 24)),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: inputDecoration(context, prefixIcon: Icons.mail_rounded, hintText: "Email"),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Value can\'t empty';
                          }
                          return null;
                        },
                        onSaved: (value) => controller.email = value,
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.showPass.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Value can\'t empty';
                            }
                            return null;
                          },
                          onSaved: (value) => controller.password = value,
                          decoration: inputDecoration(
                            context,
                            prefixIcon: Icons.lock,
                            hintText: "Password",
                            suffixIcon: Theme(
                              data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  controller.showPass.value = !controller.showPass.value;
                                },
                                icon: Icon(
                                  controller.showPass.value ? Icons.visibility_rounded : Icons.visibility_off,
                                  size: 16,
                                  color: appStore.isDarkModeOn ? white : gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Theme(
                        data: ThemeData(unselectedWidgetColor: appStore.isDarkModeOn ? Colors.white : black),
                        child: Obx(
                          () => CheckboxListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text("Remember Me", style: primaryTextStyle()),
                            value: controller.checkBoxValue.value,
                            dense: true,
                            onChanged: controller.checkBoxValue,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.validateAndSubmit();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: const BorderRadius.all(Radius.circular(45)),
                            backgroundColor: appStore.isDarkModeOn ? cardDarkColor : black,
                          ),
                          child: Text('Sign in', style: boldTextStyle(color: white)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot the password ?', style: boldTextStyle()),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Expanded(child: Container(height: 0.2, color: Colors.black26)),
                            const SizedBox(width: 10),
                            Text('Or continue with', style: secondaryTextStyle()),
                            const SizedBox(width: 10),
                            Expanded(child: Container(height: 0.2, color: Colors.black26)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
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
                                  border: Border.all(color: Colors.blue),
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
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signup);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: secondaryTextStyle(),
                            children: [
                              TextSpan(text: ' Sign up', style: boldTextStyle(size: 14)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _LoginPageState();
// }
//
// enum FormType { login, register }
//
// class _LoginPageState extends State<LoginPage> {
//   bool? checkBoxValue = false;
//   bool isIconTrue = false;
//   bool isChecked = false;
//
//
//   // final formKey = GlobalKey<FormState>();
//   // String? _email;
//   // String? _password;
//   // FormType _formType = FormType.login;
//   //
//   // bool validationAndSave() {
//   //   final form = formKey.currentState;
//   //
//   //   if (form!.validate()) {
//   //     form.save(); //save form de nhan duoc email va password
//   //     return true;
//   //   } else {
//   //     return false;
//   //   }
//   // }
//   //
//   // Future<void> validateAndSubmit() async {
//   //   if (validationAndSave()) {
//   //     try {
//   //       if (_formType == FormType.login) {
//   //         UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.toString(), password: _password.toString());
//   //
//   //         print('Signed in: ${user.user?.uid}');
//   //
//   //         Get.toNamed(Routes.home);
//   //       } else {
//   //         UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.toString(), password: _password.toString());
//   //         print('Register user: ${user.user}');
//   //       }
//   //     } on FirebaseAuthException catch (e) {
//   //       if (e.code == 'user-not-found') {
//   //         Get.snackbar('Error', 'No user found for that email.');
//   //       } else if (e.code == 'wrong-password') {
//   //         print('Wrong password provided for that user.');
//   //       }
//   //     }
//   //   }
//   // }
//
//   // void moveToRegister() {
//   //   formKey.currentState?.reset();
//   //   setState(() {
//   //     _formType = FormType.register;
//   //   });
//   // }
//   //
//   // void moveToLogin() {
//   //   formKey.currentState?.reset();
//   //   setState(() {
//   //     _formType = FormType.login;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async {
//           FocusScope.of(context).unfocus();
//           return true;
//         },
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(elevation: 0, iconTheme: const IconThemeData(color: Colors.blue)),
//           body: SingleChildScrollView(
//             child: Container(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Image(height: 130, width: 130, fit: BoxFit.contain, image: AssetImage(logo_en), color: Colors.black),
//                       Text('Login to Your Account', style: boldTextStyle(size: 24)),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         decoration: inputDecoration(context, prefixIcon: Icons.mail_rounded, hintText: "Email"),
//                         // The validator receives the text that the user has entered.
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Value can\'t empty';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) => _email = value,
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         obscureText: isIconTrue,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Value can\'t empty';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) => _password = value,
//                         decoration: inputDecoration(
//                           context,
//                           prefixIcon: Icons.lock,
//                           hintText: "Password",
//                           suffixIcon: Theme(
//                             data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
//                             child: IconButton(
//                               highlightColor: Colors.transparent,
//                               onPressed: () {
//                                 setState(() {
//                                   isIconTrue = !isIconTrue;
//                                 });
//                               },
//                               icon: Icon(
//                                 (isIconTrue) ? Icons.visibility_rounded : Icons.visibility_off,
//                                 size: 16,
//                                 color: appStore.isDarkModeOn ? white : gray,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Theme(
//                         data: ThemeData(unselectedWidgetColor: appStore.isDarkModeOn ? Colors.white : black),
//                         child: CheckboxListTile(
//                           contentPadding: const EdgeInsets.all(0),
//                           title: Text("Remember Me", style: primaryTextStyle()),
//                           value: checkBoxValue,
//                           dense: true,
//                           onChanged: (newValue) {
//                             setState(() {
//                               checkBoxValue = newValue;
//                             });
//                           },
//                           controlAffinity: ListTileControlAffinity.leading,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           validateAndSubmit();
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           decoration: boxDecorationWithRoundedCorners(
//                             borderRadius: const BorderRadius.all(Radius.circular(45)),
//                             backgroundColor: appStore.isDarkModeOn ? cardDarkColor : black,
//                           ),
//                           child: Text('Sign in', style: boldTextStyle(color: white)),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text('Forgot the password ?', style: boldTextStyle()),
//                       ),
//                       const SizedBox(height: 8),
//                       SizedBox(
//                         height: 30,
//                         child: Row(
//                           children: [
//                             Expanded(child: Container(height: 0.2, color: Colors.black26)),
//                             const SizedBox(width: 10),
//                             Text('Or continue with', style: secondaryTextStyle()),
//                             const SizedBox(width: 10),
//                             Expanded(child: Container(height: 0.2, color: Colors.black26)),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.65,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             GestureDetector(
//                               onTap: () async {
//                                 await customDialoge(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 width: 65,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.blue),
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: const Image(height: 24, width: 24, image: AssetImage(facebook)),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 await customDialoge(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 width: 65,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.blue),
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: const Image(height: 24, width: 24, image: AssetImage(google)),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 await customDialoge(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 width: 65,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.blue),
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: const Image(height: 24, width: 24, image: AssetImage(apple), color: Colors.blue),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                      const SizedBox(height: 8),
//                       TextButton(
//                         onPressed: () {
//                           Get.toNamed(Routes.signup);
//                         },
//                         child: Text.rich(
//                           TextSpan(
//                             text: "Already have an account? ",
//                             style: secondaryTextStyle(),
//                             children: [
//                               TextSpan(text: ' Sign up', style: boldTextStyle(size: 14)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ));
//   }
//
// //   List<Widget> buildInputs() {
// //     return [
// //       TextFormField(
// //         decoration: const InputDecoration(labelText: 'Email'),
// //         // The validator receives the text that the user has entered.
// //         validator: (value) {
// //           if (value == null || value.isEmpty) {
// //             return 'Value can\'t empty';
// //           }
// //           return null;
// //         },
// //         onSaved: (value) => _email = value,
// //       ),
// //       TextFormField(
// //         decoration: const InputDecoration(labelText: 'Password'),
// //         obscureText: true,
// //         validator: (value) {
// //           if (value == null || value.isEmpty) {
// //             return 'Value can\'t empty';
// //           }
// //           return null;
// //         },
// //         onSaved: (value) => _password = value,
// //       ),
// //     ];
// //   }
// //
// //   List<Widget> buildSubmitButtons() {
// //     if (_formType == FormType.login) {
// //       return [
// //         ElevatedButton(onPressed: validateAndSubmit, child: const Text('Login')),
// //         ElevatedButton(onPressed: moveToRegister, child: const Text('Create Account')),
// //       ];
// //     } else {
// //       return [
// //         ElevatedButton(onPressed: validateAndSubmit, child: const Text('Create Account')),
// //         ElevatedButton(onPressed: moveToLogin, child: const Text('Have an Account? Login?')),
// //       ];
// //     }
// //   }
// }
