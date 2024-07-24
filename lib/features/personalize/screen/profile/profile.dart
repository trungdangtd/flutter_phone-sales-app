import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/images/circular_image.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/personalization/controllers/user_controller.dart';
import 'package:flutter_store_mobile/features/personalize/screen/profile/change_name.dart';
import 'package:flutter_store_mobile/features/personalize/screen/profile/widgets/profile_menu.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/shimmer.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Hồ Sơ'),
      ),
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Ảnh đại diện
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.uploadImage.value
                          ? const TShimerEffect(
                              width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Thay đổi ảnh đại diện')),
                  ],
                ),
              ),
              //
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Thông tin hồ sơ
              const TSectionWidget(
                  title: 'Thông tin hồ sơ', showActionbutton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Tên',
                  value: controller.user.value.fullName),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Tên tài khoản',
                  value: controller.user.value.username),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Thông tin cá nhân
              const TSectionWidget(
                  title: 'Thông tin cá nhân', showActionbutton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  onPressed: () {},
                  title: 'ID người dùng',
                  icon: Iconsax.copy,
                  value: controller.user.value.id),
              TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Số điện thoại',
                  value: controller.user.value.phoneNumber),
              TProfileMenu(onPressed: () {}, title: 'Giới tính', value: 'Nam'),
              TProfileMenu(
                  onPressed: () {}, title: 'Ngày Sinh', value: '10/10/2024'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarning(),
                  child: const Text('Xóa tài khoản',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
