import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Lấy các sản phẩm nổi bật giới hạn
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      // Lấy snapshot của các sản phẩm nổi bật từ Firestore
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatures', isEqualTo: true)
          .limit(4)
          .get();

      // Chuyển đổi snapshot thành list các đối tượng ProductModel
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //getAllProducts
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      // Lấy snapshot của các sản phẩm nổi bật từ Firestore
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatures', isEqualTo: true)
          .get();

      // Chuyển đổi snapshot thành list các đối tượng ProductModel
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Lỗi rồi hihi. thử lại';
    }
  }

  //favouries
  //
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
      if (productIds.isNotEmpty) {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } else {
      // Trường hợp danh sách productIds trống, trả về một danh sách rỗng
      return [];
    }
    
  }

  Future<List<ProductModel>> getProductForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final snapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Lỗi rồi hihi. thử lại';
    }
  }

  Future<List<ProductModel>> getProductForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw 'Lỗi rồi hehe. thử lại';
    }
  }
}
