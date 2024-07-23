import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_store_mobile/common/widgets/text/product_price_text.dart';
import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
      final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              //Item
              TCartItem(
                cartItem: item,
              ),
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),

              //Nút thêm , xóa,tổng giá
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Thêm chỗ trống
                        const SizedBox(width: 70),
                        //nút thêm và xóa
                        TProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          onAdd: () => cartController.addOneToCart(item),
                          onRemove: () => cartController.removeFromCart(item),
                        ),
                      ],
                    ),
                     TProductPriceText(price: currencyFormatter.format(item.price * item.quantity)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
