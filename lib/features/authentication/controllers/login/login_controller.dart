import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/features/personalization/controllers/user_controller.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //
  final hidepassword = true.obs;
  final rememberMe = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL');
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  // email and password signin
  Future<void> emailAndPasswordSignin() async {
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
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      //Save data
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      TFullScreenLoader.stopLoadingDialog();
      //
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }

  //google sign in
  Future<void> googleSignin() async {
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

      //Google authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      //save user record
      await userController.saveUserRecord(userCredential);
      //remove loader
      TFullScreenLoader.stopLoadingDialog();
      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }
}
