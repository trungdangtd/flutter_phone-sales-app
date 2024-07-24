
import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/brand/brandshowcase.dart';
import 'package:flutter_store_mobile/features/shop/controller/brand_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/categories_model.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/boxes_shimmer.dart';
import 'package:flutter_store_mobile/utils/helpers/could_helper_function.dart';
import 'package:flutter_store_mobile/utils/helpers/list_title_shimmer.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandProductsForCategory(categoryModel.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              )
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, litmit: 3),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return TBrandShowcase(
                      images: products.map((e)=> e.thumbnail).toList(), 
                      brand: brand,
                    );
                  });
            },
            itemCount: brands.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
        });
  }
}
