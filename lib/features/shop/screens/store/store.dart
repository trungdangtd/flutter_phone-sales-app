import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/tabbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/search_container.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/product.cart/cart.menu.icon.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/controller/brand_controller.dart';
import 'package:flutter_store_mobile/features/shop/controller/categories_controller.dart';
import 'package:flutter_store_mobile/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_store_mobile/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_store_mobile/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/brand_shimmer.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brand/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final catelories = CategoriesController.instance.featuredCategories;
    return DefaultTabController(
        length: catelories.length,
        child: Scaffold(
          appBar: TAppBar(
            title: Text('Cửa Hàng',
                style: Theme.of(context).textTheme.headlineMedium),
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
                            title: 'Các hãng phổ biến',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        // Container sản phẩm
                        Obx(() {
                          if (brandController.isLoading.value) {
                            return const TBrandsShimmer();
                          }
                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(
                                'Không tìm thấy dữ liệu',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: Colors.white),
                              ),
                            );
                          }
                          return TGridLayout(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand =
                                    brandController.featuredBrands[index];

                                return TBrandCard(
                                  showBorder: true,
                                  brand: brand,
                                  onTap: () => Get.to(() => BrandProducts(
                                        brand: brand,
                                      )),
                                );
                              });
                        })
                      ],
                    ),
                  ),
                  //Tab
                  bottom: TTabbar(
                      tabs: catelories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                ),
              ];
            },
            //thân
            body: TabBarView(
                children: catelories
                    .map((category) => TCategoryTab(category: category))
                    .toList()),
          ),
        ));
  }
}
