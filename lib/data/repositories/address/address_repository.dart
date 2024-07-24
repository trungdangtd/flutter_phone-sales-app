import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/address_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'không thể tìm kiếm địa chỉ của người dùng, hãy thử lại trong vài phút';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot)=> AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    } catch (e) {
      throw 'có gì đó sai trong khi đang thêm địa chỉ, hãy thử lại';
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    } catch (e) {
      throw 'có gì đó sai trong khi cập nhật địa chỉ, hãy thử lại';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAdrress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAdrress.id;
    } catch (e) {
      throw 'có gì đó sai trong khi thêm địa chỉ, hãy thử lại';
    }
  }
}
