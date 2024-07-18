import 'package:flutter/widgets.dart';
import 'package:flutter_store_mobile/Model/user_model.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/data/repositories/user/user_repository.dart';
import 'package:flutter_store_mobile/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final passWord = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // signup
  void signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog('Đang xử lý thông tin của bạn...'
          ,TImages.imagefix);
      //Check internet
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }
      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackbar(
            title: 'Hãy đọc điều kiện sử dụng',
            message: 'Vui lòng đọc và đồng ý với điều kiện sử dụng');
        return;
      }
      //register user in the firebase authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailandPassword(
              email.text.trim(), passWord.text.trim());

      //Save Authenticathed userdata in firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoadingDialog();
      TLoaders.successSnackbar(
          title: 'Đăng ký thành công',
          message: 'Tài khoản của bạn đã được tạo! xác thực email để tiếp tục');

      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackbar(title: 'mất kết nối', message: e.toString());
      
    }
  }
}
