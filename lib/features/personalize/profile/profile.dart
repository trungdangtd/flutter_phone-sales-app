import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/images/circular_image.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/personalize/profile/widgets/profile_menu.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TCircularImage(
                        image: TImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
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
                  onPressed: () {}, title: 'Tên', value: 'Hoàng A Trung'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Tên tài khoản',
                  value: 'hoang_a_trung'),

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
                  value: '12345'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: 'hoangatrung@gmail.com'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Số điện thoại',
                  value: '0827999420'),
              TProfileMenu(onPressed: () {}, title: 'Giới tính', value: 'Nam'),
              TProfileMenu(
                  onPressed: () {}, title: 'Ngày Sinh', value: '10/10/2024'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
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
