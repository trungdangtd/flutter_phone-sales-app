import 'dart:convert';

import 'package:flutter_store_mobile/data/repositories/product/product_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/local_storage/storage_utility.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  initFavourites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToost(message: 'Sản phẩm đã được thêm vào mục yêu thích');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavouritesToStorage();
      favorites.refresh();
      TLoaders.customToost(message: 'Sản phẩm đã xoá khỏi mục yêu thích');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance(). saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProduct()async{
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}
