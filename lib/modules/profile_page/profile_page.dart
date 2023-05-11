import 'package:firebase_project/modules/profile_page/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/widgets.dart';
import '../../main.dart';
import '../../values/styles/colors.dart';

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
          appBar: careaAppBarWidget(context, titleText: "Fill Your Profile"),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Observer(
                          builder: (context) => GestureDetector(
                            onTap: () async {},
                            child: Image.asset(
                              "assets/userImage.jpg",
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ).cornerRadiusWithClipRRect(60),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 8,
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.edit, color: white, size: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextFormField(

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter user name';
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) {

                      },
                      decoration: inputDecoration(context, hintText: "Full name"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onFieldSubmitted: (v) {},
                      decoration:
                          inputDecoration(context, hintText: "Nickname"),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      readOnly: true,
                      onTap: () {},
                      onFieldSubmitted: (v) {},
                      decoration: inputDecoration(
                        context,
                        hintText: "Date of Birth",
                        suffixIcon: Icon(Icons.calendar_month_rounded,
                            size: 16,
                            color: appStore.isDarkModeOn ? white : gray),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter correct email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) {},
                      decoration: inputDecoration(
                        context,
                        hintText: "Email",
                        suffixIcon: Icon(Icons.mail_outline_rounded,
                            size: 16,
                            color: appStore.isDarkModeOn ? white : gray),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (int.tryParse(value!) == null) {
                          return 'Only Number are allowed';
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) {},
                      decoration: inputDecoration(
                        context,
                        hintText: "Phone number",
                        suffixIcon: Icon(Icons.phone,
                            size: 16,
                            color: appStore.isDarkModeOn ? white : gray),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultRadius)),
                        backgroundColor: appStore.isDarkModeOn
                            ? cardDarkColor
                            : editTextBgColor,
                      ),
                      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: DropdownButton<String>(
                        elevation: 16,
                        style: primaryTextStyle(),
                        hint: Text('Gender', style: primaryTextStyle()),
                        isExpanded: true,
                        underline: Container(
                          height: 0,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (newValue) {},
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? cardDarkColor
                              : Colors.black,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Text('Continue',
                            style: boldTextStyle(color: white)),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
