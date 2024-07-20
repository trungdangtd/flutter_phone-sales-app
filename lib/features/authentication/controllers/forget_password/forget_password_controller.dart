import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send Reset Password Email
  sendPasswordResetEmail() async {
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
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove loader
      TFullScreenLoader.stopLoadingDialog();

      //Show Success Screen
      TLoaders.successSnackbar(
          title: 'Thành công',
          message:
              'Chúng tôi đã gửi email đặt lại mật khẩu đến bạn, vui lòng kiểm tra email của bạn'.tr);

      //redirect to login screen
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }

  //resend Reset Password Email
  resendPasswordResetEmail(String email) async {
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



      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      //remove loader
      TFullScreenLoader.stopLoadingDialog();

      //Show Success Screen
      TLoaders.successSnackbar(
          title: 'Thành công',
          message:
              'Chúng tôi đã gửi email đặt lại mật khẩu đến bạn, vui lòng kiểm tra email của bạn'.tr);

    
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    }
  }
}
