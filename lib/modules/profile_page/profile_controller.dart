import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model/user_model.dart';

class ProfileController extends GetxController {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> updateUser(User user) async{
    try {
      // await userCollection.doc(user.).update(
      //
      // );

    } catch(e){
      print(e);
    }


  }

}
