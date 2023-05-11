import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../values/styles/images.dart';

class WalkthroughController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  static WalkthroughController get instance => Get.find();
  final currentPage = 0.obs;

  final list = <WalkThroughModelClass>[].obs;

  Future<void> init() async {
    list.add(WalkThroughModelClass(
        title: 'The best car in your \nhands with carea', image: ha1));
    list.add(WalkThroughModelClass(
        title: 'The best car in your \nhands with carea', image: ha2));
    list.add(WalkThroughModelClass(
        title: 'The best car in your \nhands with carea', image: ha3));
  }
}
