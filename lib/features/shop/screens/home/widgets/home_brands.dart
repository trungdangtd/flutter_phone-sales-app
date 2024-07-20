import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/image_text/vertical_image_text.dart';
import 'package:flutter_store_mobile/features/shop/controller/categories_controller.dart';
import 'package:flutter_store_mobile/features/shop/screens/sub_brand/sub_brand.dart';
import 'package:flutter_store_mobile/utils/categories_shimmer.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.put(CategoriesController());
    return Obx(() {
      if (categoriesController.isLoading.value) return const TCategoryShimmer();
      if (categoriesController.featuredCategories.isEmpty) {
        return Center(
            child: Text('Không tìm thấy dữ liệu',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }
      return SizedBox(
        height: 110,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoriesController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoriesController.featuredCategories[index];
            return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const TSubBrandScreen()));
          },
        ),
      );
    });
  }
}
