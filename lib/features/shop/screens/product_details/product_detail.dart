import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_store_mobile/utils/constants/enums.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar:  TBottomAddToCart(product: productModel),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Slider kiểu sản phẩm
            TProductImageSlider(productModel: productModel),
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
                  TProductMetaData(
                    product: productModel,
                  ),
                  //Thuộc tính sản phẩm
                  if (productModel.productType ==
                      ProductType.variable.toString())
                    TProductAttributes(product: productModel),
                  if (productModel.productType ==
                      ProductType.variable.toString())
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
                  ReadMoreText(
                    productModel.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Xem thêm',
                    trimExpandedText: 'Rút gọn',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
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
