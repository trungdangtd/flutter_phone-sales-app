import 'package:flutter_store_mobile/data/repositories/product/product_repository.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/constants/enums.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show Loader while loading Products
      isLoading.value = true;
      // ... code để lấy danh sách sản phẩm nổi bật ...
      final product = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(product);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      
      // ... code để lấy danh sách sản phẩm nổi bật ...
      final product = await productRepository.getFeaturedProducts();

      return product;
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    } 
  }

  String getProductPrice(ProductModel product) {
  double smallestPrice = double.infinity;
  double largestPrice = 0.0;
  final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

  // Nếu sản phẩm không có biến thể, trả về giá bán hoặc giá khuyến mãi
  if (product.productType == ProductType.single.toString()) {
    double price = product.salePrice > 0 ? product.salePrice : product.price;
    return currencyFormatter.format(price);
  } else {
    // Tính toán giá nhỏ nhất và lớn nhất trong các biến thể
    for (var variation in product.productVariations!) {
      // Xác định giá để so sánh (giá khuyến mãi nếu có, ngược lại là giá thường)
      double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      // Cập nhật giá nhỏ nhất và lớn nhất
      if (priceToConsider < smallestPrice) {
        smallestPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }

    // Ở đây bạn có thể sử dụng smallestPrice hoặc largestPrice tùy theo yêu cầu
    if (smallestPrice == largestPrice) {
      return currencyFormatter.format(largestPrice);
    } else {
      // Otherwise, return a price range
      return '${currencyFormatter.format(smallestPrice)} - ${currencyFormatter.format(largestPrice)}';
    }
  }
}


  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    // Kiểm tra điều kiện hợp lệ của giá gốc và giá khuyến mãi
    if (salePrice == null || salePrice <= 0.0) {
      return null; // Nếu giá khuyến mãi không hợp lệ, trả về null
    }
    if (originalPrice <= 0) {
      return null; // Nếu giá gốc không hợp lệ, trả về null
    }

    // Tính phần trăm giảm giá
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    // Trả về phần trăm giảm giá dưới dạng chuỗi, làm tròn đến số nguyên
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Còn hàng' : 'Hết hàng';
  }
}
