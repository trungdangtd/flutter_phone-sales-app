import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: TAppBar(
          title: Text('Đơn hàng của tôi',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //Đơn hàng
        child: TOrdersListItems(),
      ),
    );
  }
}
