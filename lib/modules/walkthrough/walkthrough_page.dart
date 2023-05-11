import 'package:firebase_project/modules/walkthrough/walkthrough_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class WalkThroughScreen extends GetView<WalkthroughController> {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.registration);
            },
            child: const Text('Skip')),
      ),
    );
  }
}
