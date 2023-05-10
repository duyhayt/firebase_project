import 'package:firebase_project/modules/signup_page/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                      label: Text('Email'), prefix: Icon(Icons.person)),
                ),
                TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                      label: Text('Password'), prefix: Icon(Icons.password)),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                      }
                    },
                    child: const Text('SignUp'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
