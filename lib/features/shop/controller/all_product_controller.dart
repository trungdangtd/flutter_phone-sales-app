import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_store_mobile/data/repositories/product/product_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get to => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductByQuery(query);

      return products;
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Lỗi rồi nha', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Theo Tên':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Giá Cao':
        products.sort((a, b) => b.salePrice.compareTo(a.salePrice));
        break;
      case 'Giá thấp':
        products.sort((a, b) => a.salePrice.compareTo(b.salePrice));
        break;
      case 'Khuyến mãi':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProduct(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Theo Tên');
  }
}
