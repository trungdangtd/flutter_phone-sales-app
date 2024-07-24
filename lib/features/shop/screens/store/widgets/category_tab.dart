import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/controller/categories_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/categories_model.dart';
import 'package:flutter_store_mobile/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_store_mobile/features/shop/screens/store/widgets/category_brand.dart';
import 'package:flutter_store_mobile/utils/helpers/could_helper_function.dart';
import 'package:flutter_store_mobile/utils/helpers/vertical_product_shimmer.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Hãng

                CategoryBrand(categoryModel: category),
                const SizedBox(height: TSizes.spaceBtwItems),
                //Sản Phẩm
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const TVerticalProductShimmer());
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return Column(
                        children: [
                          TSectionWidget(
                            title: 'Sản phẩm bạn có thể thích',
                            onPressed: () => Get.to(AllProducts(
                              title: category.name,
                              futureMethods: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            )),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => TProductCardVertical(
                                    productModel: products[index],
                                  )),
                          const SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
