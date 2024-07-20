import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/Model/user_model.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/data/repositories/user/user_repository.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login.dart';
import 'package:flutter_store_mobile/features/personalize/screen/profile/widgets/re_auth_user_login.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final uploadImage = false.obs;
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reauth = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final users = await userRepository.fetchUserDetail();
      user(users);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final namePart =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          //Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: namePart[0],
            lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: 'dữ liệu chưa được lưu',
          message:
              'có lỗi đã xảy ra khi bạn thực hiện lưu thông tin, hãy kiểm tra lại');
    }
  }

  //delete account warning
  void deleteAccountWarning() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Xoá tài khoản',
        middleText:
            'Bạn có chắc chắn rằng là mình muốn xoá tài khoản không? hành động này sẽ không thể hoàn lại!',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Xoá'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!),
            child: const Text('Huỷ')));
  }

  //delete acount
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang xử lý', TImages.imagefix);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // await auth.deleteAccount();
        TFullScreenLoader.stopLoadingDialog();
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.warningSnackbar(
          title: 'đã có lỗi xảy ra', message: e.toString());
    }
  }

  //reauthenticate user
  void reAuthenticateEmailandPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Đang xử lý', TImages.imagefix);

      //Check internet
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      //form validation
      if (!reauth.currentState!.validate()) {
        TFullScreenLoader.stopLoadingDialog();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailandPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoadingDialog();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoadingDialog();
      TLoaders.warningSnackbar(
          title: 'đã có lỗi xảy ra', message: e.toString());
    }
  }

  //upload profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        uploadImage.value = true;

        final imageUrl =
            await userRepository.upLoadImage('Users/Image/Profile/', image);

        //update  User image
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackbar(
            title: 'Thành công', message: 'Ảnh đã được cập nhật');
      }
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    } finally {
      uploadImage.value = false;
    }
  }
}
