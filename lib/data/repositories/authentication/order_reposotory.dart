import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderReposotory extends GetxController {
  static OrderReposotory get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUsersOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) throw 'Không tìm thấy người dùng';

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'có gì đó sai khi lấy dữ liệu';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'có gì đó sai khi lưu dữ liệu';
    }
  }
}
