import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class WalkthroughController extends GetxController {
  static WalkthroughController get instance => Get.find();
  final currentPage = 0.obs;
  List<WalkThroughModelClass> list = [].obs as List<WalkThroughModelClass>;
}