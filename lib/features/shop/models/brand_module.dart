import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatures;
  int? productsCount;

  BrandModel({required this.id, required this.name, required this.isFeatures, this.productsCount, required this.image});

  static BrandModel empty() => BrandModel(id: '', name: '', isFeatures: false, image: '');

  toJson() {
  return {
    'Id': id,
    'Name': name,
    'Image': image,
    'ProductsCount': productsCount,
    'IsFeatures': isFeatures,
  };
}

  factory BrandModel.fromJson(Map<String, dynamic> document) {
  final data = document;

  if (data.isEmpty) return BrandModel.empty();

  return BrandModel(
    id: data['Id'] ?? '',
    name: data['Name'] ?? '',
    image: data['Image'] ?? '',
    isFeatures: data['IsFeatures'] ?? false,
    productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
  );
}

factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  if (document.data() != null) {
    final data = document.data()!;
    
    // Map JSON Record to the Model
    return BrandModel(
      id: document.id,
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      productsCount: data['ProductsCount'] ?? '',
      isFeatures: data['IsFeatures'] ?? false,
    );
  } else {
    return BrandModel.empty();
  }
}

}
