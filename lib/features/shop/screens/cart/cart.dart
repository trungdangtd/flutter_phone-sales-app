import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_store_mobile/common/widgets/text/product_price_text.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Giỏ hàng',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Thanh Toán \$200')),
      ),
    );
  }
}
