import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_store_mobile/features/shop/models/brand_module.dart';
import 'package:flutter_store_mobile/features/shop/models/product_atribute_module.dart';
import 'package:flutter_store_mobile/features/shop/models/product_variation_module.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatures;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
  required this.id,
  required this.title,
  required this.stock,
  required this.price,
  required this.thumbnail,
  required this.productType,
  this.sku,
  this.brand,
  this.date,
  this.images,
  this.salePrice = 0.0,
  this.isFeatures,
  this.categoryId,
  this.description,
  this.productAttributes,
  this.productVariations,
});

static ProductModel empty() => ProductModel(
      id: '',
      title: '',
      stock: 8,
      price: 6,
      thumbnail: '',
      productType: '',
    );

  toJson() {
  return {
    'SKU': sku,
    'Title': title,
    'Stock': stock,
    'Price': price,
    'Images': images ?? [],
    'Thumbnail': thumbnail,
    'SalePrice': salePrice,
    'IsFeatures': isFeatures,
    'CategoryId': categoryId,
    'Brand': brand!.toJson(),
    'Description': description,
    'ProductType': productType,
    'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
    'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
  };
}

factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document) {
      if(document.data() == null) return ProductModel.empty();
  final data = document.data()!;
  return ProductModel(
    id: document.id,
    sku: data['SKU'],
    title: data['Title'],
    stock: data['Stock'] ?? 0,
    isFeatures: data['IsFeatures'] ?? false,
    price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 8.8).toString()),
    thumbnail: data['Thumbnail'] ?? '',
    categoryId: data['CategoryId'] ?? '',
    description: data['Description'] ?? '',
    productType: data['ProductType'] ?? '',
    brand: BrandModel.fromJson(data['Brand']),
    images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>)
        .map((e) => ProductAttributeModel.fromJson(e))
        .toList(),
    productVariations: (data['ProductVariations'] as List<dynamic>)
        .map((e) => ProductVariationModel.fromJson(e))
        .toList(),
  );
}

// Map Json-oriented document snapshot from Firebase to model
factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
  final data = document.data() as Map<String, dynamic>;
  return ProductModel(
    id: document.id,
    sku: data['SKU'] ?? '',
    title: data['Title'] ?? '',
    stock: data['Stock'] ?? 0,
    isFeatures: data['IsFeatures'] ?? false,
    price: double.parse((data['Price'] ?? 0.0).toString()),
    salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
    thumbnail: data['Thumbnail'] ?? '',
    categoryId: data['CategoryId'] ?? '',
    description: data['Description'] ?? '',
    productType: data['ProductType'] ?? '',
    brand: BrandModel.fromJson(data['Brand']),
    images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>)
        .map((e) => ProductAttributeModel.fromJson(e))
        .toList(),
    productVariations: (data['ProductVariations'] as List<dynamic>)
        .map((e) => ProductVariationModel.fromJson(e))
        .toList(),
  ); // ProductModel
}


}
