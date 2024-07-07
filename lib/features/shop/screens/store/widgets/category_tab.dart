import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import '../../../../../common/widgets/brand/brandshowcase.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Hãng
                const TBrandShowcase(images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ]),
                const TBrandShowcase(images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ]),
                const SizedBox(height: TSizes.spaceBtwItems),
                //Sản Phẩm
                TSectionWidget(
                    title: 'Sản phẩm bạn có thể thích', onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical()),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ]);
  }
}
