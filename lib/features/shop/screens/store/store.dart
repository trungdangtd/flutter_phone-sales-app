import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/search_container.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/product.cart/cart.menu.icon.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/enums.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/text/brand_title_text_verfied_icon.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Cửa Hàng', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCardCountedIcon(onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Thanh tìm kiếm
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Tìm kiếm sản phẩm',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      //--Title Hãng
                      TSectionWidget(
                          title: 'Các hãng phổ biến', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // Container sản phẩm
                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: TRoundedContainer(
                                padding: const EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    //--Icon
                                    Flexible(
                                      child: TCircularImage(
                                        isNetworkImage: false,
                                        image: TImages.clothIcon,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            THelperFunctions.isDarkMode(context)
                                                ? TColors.white
                                                : TColors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                        width: TSizes.spaceBtwItems / 2),

                                    //Text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const TBrandTitleWithVerifiedIcon(
                                              title: 'Nike',
                                              brandTextSize: TextSizes.large),
                                          Text(
                                            '256 sản phẩm sadasdasdasdsdasdsasd',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
