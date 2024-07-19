import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_store_mobile/Model/user_model.dart';
import 'package:flutter_store_mobile/data/repositories/user/user_repository.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final namePart =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: namePart[0],
          lastName: namePart.length>1? namePart.sublist(1).join(' ') :'',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
      //save user data
      await userRepository.saveUserRecord(user); 
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: 'dữ liệu chưa được lưu',
          message:
              'có lỗi đã xảy ra khi bạn thực hiện lưu thông tin, hãy kiểm tra lại');
    }
  }
}
