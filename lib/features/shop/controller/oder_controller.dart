import 'package:flutter/foundation.dart';
import 'package:flutter_store_mobile/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/order_reposotory.dart';
import 'package:flutter_store_mobile/features/shop/controller/address_controller.dart';
import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:flutter_store_mobile/features/shop/controller/checkout_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/order_model.dart';
import 'package:flutter_store_mobile/navigation_menu.dart';
import 'package:flutter_store_mobile/utils/constants/enums.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/popups/full_screen_loader.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class OderController extends GetxController {
  static OderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderReposotory());

  Future<List<OrderModel>> fetchUsersOrder() async {
    try {
      final userOrders = await orderRepository.fetchUsersOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackbar(title: 'Lỗi rồi', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Đang xử lý đơn hàng của bạn', TImages.pencilLoading);

      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) return;

      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now());
      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => SuccessScreen(
          image: TImages.ordercomplete,
          title: 'Thanh toán thành công!',
          subTitle: 'Sản phẩm của bạn sẽ được giao sớm',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Lỗi rồi', message: e.toString());
    }
  }
}
