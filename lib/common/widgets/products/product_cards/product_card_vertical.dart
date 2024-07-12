import "package:flutter/material.dart";
import "package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart";
import "package:flutter_store_mobile/common/widgets/images/rounded_image.dart";
import "package:flutter_store_mobile/common/widgets/text/product_price_text.dart";
import "package:flutter_store_mobile/common/widgets/text/product_title_text.dart";
import "package:flutter_store_mobile/features/shop/screens/product_details/product_detail.dart";
import "package:flutter_store_mobile/utils/constants/colors.dart";
import "package:flutter_store_mobile/utils/constants/images_string.dart";
import "package:flutter_store_mobile/utils/constants/sizes.dart";
import "package:flutter_store_mobile/utils/helpers/helper_function.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "../../../style/shadows.dart";
import "../../icons/t_circular_icon.dart";
import "../../text/brand_title_text_verfied_icon.dart";

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    //Container san pham
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // mã giảm giá, nút yêu thích,hình
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///thumbnail
                  const TRoundedImage(
                    imageUrl: TImages.productImage3,
                    applyImageRadius: true,
                  ),

                  /// mã giảm giá
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),

                  ///Button Yêu thích
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            // thông tin chi tiết
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                        title: 'Green Nike Air Shoe', smallSize: true),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: 'Nike'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Giá
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: '35.0'),
                  ),
                ),

                // Button add vào giỏ hàng
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: TColors.white))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
