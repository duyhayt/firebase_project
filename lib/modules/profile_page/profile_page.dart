import 'package:firebase_project/modules/profile_page/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
          // appBar: (widget.isAppbarNeeded == null) ? careaAppBarWidget(context, titleText: "Fill Your Profile") : widget.appBar,
          body: Container(
        color: Colors.red,
      )),
    );
  }
}
