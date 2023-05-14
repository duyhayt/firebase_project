import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../main.dart';
import '../../routes/app_routes.dart';
import 'notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add User',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controller.name,
            decoration: decoration('Name'),
          ),
          const SizedBox(height: 25),
          TextField(
            controller: controller.age,
            decoration: decoration('Age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 25),
          TextField(
            controller: controller.address,
            decoration: decoration('Address'),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              controller.createUser(controller.name.text,
                  int.parse(controller.age.text), controller.address.text);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : Colors.black,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text('Create User', style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );
}
