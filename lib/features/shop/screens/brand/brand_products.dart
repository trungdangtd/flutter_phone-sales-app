import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/brand/brand_card.dart';
import 'package:flutter_store_mobile/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_store_mobile/features/shop/controller/brand_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/brand_module.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/could_helper_function.dart';
import 'package:flutter_store_mobile/utils/helpers/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if(widget != null) return widget;

                    final brandProduct = snapshot.data!;
                    return  TSortableProducts(
                      products: brandProduct,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
