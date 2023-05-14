import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/modules/list_user_page/list_user_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/user_test_crud_model.dart';

class ListUserPage extends GetView<ListUserController> {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListUserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Users',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.users.doc('my-id').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("Full Name: ${data['name']} ${data['age']}");
          }

          return const Text("loading");
        },
      ),
    );
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(
          child: Text('${user.age}'),
        ),
        title: Text(user.name),
        subtitle: Text(user.address),
      );
}
