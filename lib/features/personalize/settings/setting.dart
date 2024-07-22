import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:flutter_store_mobile/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login.dart';
import 'package:flutter_store_mobile/features/personalize/screen/address/address.dart';
import 'package:flutter_store_mobile/features/shop/screens/order/order.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/list_tile/user_profile_tile.dart';
import '../screen/profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                      title: Text('Tài khoản',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionWidget(
                      title: 'Tùy chỉnh tài khoản', showActionbutton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingMenuTile(
                      icon: Iconsax.home,
                      title: 'Địa chỉ',
                      subTitle: 'Thiết lập địa chỉ giao hàng',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'Giỏ Hàng',
                      subTitle: 'Thêm,xóa sản phẩm trong giỏ hàng',
                      onTap: () => Get.to(() => const OrderScreen())),
                  const TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'Đơn đặt hàng',
                      subTitle: 'Các đơn hàng'),
                  const TSettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Tài khoản ngân hàng',
                      subTitle: 'Thiết lập tài khoản ngân hàng'),
                  const TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'Phiếu giảm giá',
                      subTitle: 'Các phiếu giảm giá'),
                  const TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Thông báo',
                      subTitle: 'Thông báo mới nhất'),
                  const TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Quyền riêng tư',
                      subTitle: 'Quản lý dữ liệu'),

                  //Nút Đăng Xuất
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => Get.offAll(const LoginScreen()),
                        child: const Text('Đăng Xuất')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
