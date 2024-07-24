import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:flutter_store_mobile/utils/helpers/pricing_cacultor.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng', style: Theme.of(context).textTheme.bodyMedium),
            Text(currencyFormatter.format(subTotal),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Phí ship
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phí giao hàng',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(TPricingCalculator.calculateShippingCost(subTotal, 'VN'),
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        //Thuế
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Thuế', style: Theme.of(context).textTheme.bodyMedium),
            Text(TPricingCalculator.calculateTax(subTotal, 'VN'),
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),
        //Tổng tất cả
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng đơn hàng',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(currencyFormatter.format(TPricingCalculator.calculateTotalPrice(subTotal, 'VN')) ,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
