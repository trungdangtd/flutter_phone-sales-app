import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/search_container.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_store_mobile/features/shop/screens/home/widgets/home_brands.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  //SreachBar
                  TSearchContainer(
                    text: 'Tìm kiếm sản phẩm',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Categories heading
                        TSectionWidget(
                          title: 'Các hãng điện thoại',
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        //Categories list
                        THomeBrands()
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Các phần khác của màn hình
            //Slider
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Title
                  TSectionWidget(
                      title: 'Các sản phẩm phổ biến', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Grid view San pham
                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
