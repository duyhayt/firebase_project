import 'package:firebase_project/modules/walkthrough/walkthrough_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../components/app_components.dart';
import '../../main.dart';
import '../../registration/registration_page.dart';

class WalkThroughScreen extends GetView<WalkthroughController> {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    Get.put(WalkthroughController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView(
            controller: pageController,
            children: controller.list.map((e) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(e.image.validate()),
                  const SizedBox(height: 20),
                  Text(e.title.validate(),
                      style: boldTextStyle(size: 28),
                      textAlign: TextAlign.center),
                ],
              );
            }).toList(),
          ),
          Positioned(
            top: 24,
            child: TextButton(
              onPressed: () {
                const RegistrationScreen().launch(context, isNewTask: true);
              },
              child: Text('Skip', style: primaryTextStyle()),
            ),
          ),
          Positioned(
            bottom: 130,
            right: 0,
            left: 0,
            child: DotIndicator(
              indicatorColor: appStore.isDarkModeOn ? white : Colors.black,
              pageController: pageController,
              pages: controller.list,
              currentDotSize: 24,
              boxShape: BoxShape.circle,
              currentDotWidth: 60,
              currentBoxShape: BoxShape.rectangle,
              unselectedIndicatorColor: Colors.grey.shade400,
              onPageChanged: (index) {
                controller.currentPage.value = index;
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: GestureDetector(
              onTap: () {
                if (controller.currentPage.value == 2) {
                  const RegistrationScreen().launch(context, isNewTask: true);
                } else {
                  pageController.animateToPage(
                    controller.currentPage.value + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: CircularBlackDecoration,
                child: Text("Get Started", style: boldTextStyle(color: white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
