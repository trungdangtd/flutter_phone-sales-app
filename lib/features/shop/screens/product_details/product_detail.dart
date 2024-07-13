import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Slider kiểu sản phẩm
            const TProductImageSlider(),
            //Chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //Đánh giá - Chia sẻ
                  const TRatingAndShare(),
                  //Giá-hãng-tồn kho
                  const TProductMetaData(),
                  //Thuộc tính sản phẩm
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Nút check
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Check out'))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //Mô tả
                  const TSectionWidget(
                      title: 'Mô tả chi tiết', showActionbutton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Đây là 1 mô tả sản phẩm cho đôi giày Nike xanh lá. Chúng ta có thê điều chỉnh thêm vài chi tiết mô tả thêm theo ý muốn. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Xem thêm',
                    trimExpandedText: 'Rút gọn',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  //Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionWidget(
                          title: 'Đánh giá (25)', showActionbutton: true),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right4, size: 25)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
