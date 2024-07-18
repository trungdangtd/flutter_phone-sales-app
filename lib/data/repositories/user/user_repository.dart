import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store_mobile/Model/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
      
    }  on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'có gì đó sai, hãy thử lại';
    }
  }
}
