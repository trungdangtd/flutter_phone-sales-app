import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/data/repositories/user/user_repository.dart';
import 'package:flutter_store_mobile/features/personalization/controllers/user_controller.dart';
import 'package:flutter_store_mobile/features/personalize/screen/profile/profile.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstname.text = userController.user.value.firstName;
    lastname.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Đang xử lý thông tin của bạn...', TImages.imagefix);
      //Check internet
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastname.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstname.text.trim();
      userController.user.value.lastName = lastname.text.trim();

      TFullScreenLoader.stopLoadingDialog();

      TLoaders.successSnackbar(
          title: 'Chúc mừng', message: 'tên của bạn đã được cập nhật');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }
}
