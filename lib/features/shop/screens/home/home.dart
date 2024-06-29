import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/search_container.dart';
import 'package:flutter_store_mobile/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
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
                  SizedBox(height: TSizes.spaceBtwSections),
                  //Categories
                ],
              ),
            ),
            // Các phần khác của màn hình
          ],
        ),
      ),
    );
  }
}
