import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_store_mobile/features/shop/controller/fivouries_controller.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () =>  TCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color:controller.isFavourite(productId)? TColors.error : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
