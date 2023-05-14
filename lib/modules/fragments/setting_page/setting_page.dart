import 'package:firebase_project/modules/fragments/setting_page/setting_controller.dart';
import 'package:firebase_project/repository/authentication/authentication_repository.dart';
import 'package:firebase_project/store/AppStore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../../../routes/app_routes.dart';
import '../../../values/styles/colors.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationRepository controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Stack(
                children: [
                  Image.asset("assets/userImage.jpg",
                          height: 100, width: 100, fit: BoxFit.cover)
                      .cornerRadiusWithClipRRect(60),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.edit, color: white, size: 16),
                    ).onTap(() {}),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Duy Hà Nguyễn', style: boldTextStyle(size: 18)),
              const SizedBox(height: 8),
              Text('Developer', style: secondaryTextStyle()),
              const SizedBox(height: 16),
              const Divider(height: 0),
              const SizedBox(height: 16),
              SettingItemWidget(
                leading: const Icon(Icons.person_outline, color: defaultColor),
                title: "Edit Profile",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  Get.toNamed(Routes.profile);
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading:
                    const Icon(Icons.location_on_outlined, color: defaultColor),
                title: "List Users",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  Get.toNamed(Routes.listUser);
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.notifications_active_outlined,
                    color: defaultColor),
                title: "Notification",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  Get.toNamed(Routes.notification);
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.payment_rounded, color: defaultColor),
                title: "Payment",
                titleTextStyle: boldTextStyle(),
                onTap: () {},
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.security, color: defaultColor),
                title: "Security",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  //
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading:
                    const Icon(Icons.wb_sunny_outlined, color: defaultColor),
                title: "Dark Mode",
                titleTextStyle: boldTextStyle(),
                onTap: () async {
                  if (appStore.isDarkModeOn) {
                    appStore.toggleDarkMode(value: false);
                  } else {
                    appStore.toggleDarkMode(value: true);
                  }
                },
                trailing: SizedBox(
                  height: 20,
                  width: 30,
                  child: Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: appStore.isDarkModeOn,
                    onChanged: (bool value) {
                      appStore.toggleDarkMode(value: value);
                    },
                  ),
                ),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.lock_outline, color: defaultColor),
                title: "Privacy Policy",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  //
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading:
                    const Icon(Icons.help_center_outlined, color: defaultColor),
                title: "Help Support",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  //
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.group_outlined, color: defaultColor),
                title: "Invite Friends",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  //
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
              SettingItemWidget(
                leading: const Icon(Icons.login, color: defaultColor),
                title: "Logout",
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  controller.logout();
                },
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 18, color: defaultColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
