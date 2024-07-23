import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/loader/animation_loader.dart';
import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:flutter_store_mobile/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_store_mobile/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_store_mobile/navigation_menu.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Giỏ hàng',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        //không tìm thấy widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Giỏ hàng đang trống',
          animation: TImages.emptyCart,
          showAction: true,
          actionText: 'Hãy mua sản phẩm ngay thôi',
          onactionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),

              //--Item trong giỏ hàng
              child: TCartItems(),
            ),
          );
        }
      }),
      //nút thanh toán
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() => Text(
                      'Thanh Toán ${currencyFormatter.format(controller.totalCartPrice.value)}'))),
            ),
    );
  }
}
