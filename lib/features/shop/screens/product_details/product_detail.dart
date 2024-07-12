import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:flutter_store_mobile/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_store_mobile/common/widgets/images/rounded_image.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Slider kiểu sản phẩm
            TProductImageSlider(),
            //Chi tiết sản phẩm
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //Đánh giá - Chia sẻ
                  TRatingAndShare(),
                  //Giá-hãng-tồn kho
                  TProductMetaData(),
                  //Thuộc tính sản phẩm
                  //Nút check
                  //Mô tả
                  //Review
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
