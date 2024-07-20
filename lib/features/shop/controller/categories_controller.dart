import 'package:flutter_store_mobile/data/repositories/categories/cate_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/categories_model.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load categories data
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      var categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatures && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Có lỗi xảy ra', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
