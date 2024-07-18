import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_store_mobile/common/widgets/text/product_price_text.dart';

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
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          //Item
          const TCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),

          //Nút thêm , xóa,tổng giá
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Thêm chỗ trống
                    SizedBox(width: 70),
                    //nút thêm và xóa
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '200'),
              ],
            )
        ],
      ),
    );
  }
}
