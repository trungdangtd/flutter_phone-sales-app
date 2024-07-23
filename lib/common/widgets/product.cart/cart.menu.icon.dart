
import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:flutter_store_mobile/features/shop/screens/cart/cart.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCardCountedIcon extends StatelessWidget {
  const TCardCountedIcon({
    super.key,
    this.iconColor,
    this.counterBgcolor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgcolor, counterTextColor;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color:
                      counterBgcolor ?? (dark ? TColors.white : TColors.black),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Obx(
                  () => Text(controller.noOfCartItems.value.toString(),
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: counterTextColor ??
                              (dark ? TColors.white : TColors.black),
                          fontSizeFactor: 0.8)),
                ),
              )),
        )
      ],
    );
  }
}
