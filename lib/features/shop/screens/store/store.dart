import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/tabbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/search_container.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/product.cart/cart.menu.icon.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import '../../../../common/widgets/brand/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
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
                            title: 'Các hãng phổ biến', onPressed: () {}),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        // Container sản phẩm
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(showBorder: false);
                            })
                      ],
                    ),
                  ),
                  //Tab
                  bottom: const TTabbar(
                    tabs: [
                      Tab(child: Text('Thể thao')),
                      Tab(child: Text('Năng động')),
                      Tab(child: Text('Phá chất')),
                      Tab(child: Text('Thể thao')),
                      Tab(child: Text('Thể thao')),
                    ],
                  ),
                ),
              ];
            },
            //thân
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab()
              ],
            ),
          ),
        ));
  }
}
