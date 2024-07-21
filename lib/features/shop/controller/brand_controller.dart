import 'package:flutter_store_mobile/data/repositories/brands/brands_repository.dart';
import 'package:flutter_store_mobile/data/repositories/product/product_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/brand_module.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandsRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatures ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Lỗi ở đâu đó rồi', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int litmit = -1}) async {
    try {
      final products =
          await ProductRepository.instance.getProductForBrand(brandId: brandId, limit: litmit);
      return products;
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Lỗi nữa rồi', message: e.toString());
      return [];
    }
  }

  //get beand for category
  Future<List<BrandModel>> getBrandProductsForCategory(
      String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Lỗi nữa rồi nè', message: e.toString());
      return [];
    }
  }
}
