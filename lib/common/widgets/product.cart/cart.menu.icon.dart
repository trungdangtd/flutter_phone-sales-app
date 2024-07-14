import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/shop/screens/cart/cart.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCardCountedIcon extends StatelessWidget {
  const TCardCountedIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
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
                  color: TColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text("2",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: TColors.white, fontSizeFactor: 0.8)),
              )),
        )
      ],
    );
  }
}
