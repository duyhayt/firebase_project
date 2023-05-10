import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SettingPage extends GetView<AuthenticationRepository> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationRepository());
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              controller.logout();
              Get.offAllNamed(Routes.login);
            }, icon: const Icon(Icons.logout))
          ],
        ),
        body: Container(
          color: Colors.blue,
        ));
  }
}
