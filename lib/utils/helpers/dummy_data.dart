import 'package:flutter_store_mobile/features/shop/models/categories_model.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';

class DummyData{
  static final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: TImages.phonecate, name: 'ĐTTM', isFeatures: true ),
  CategoryModel(id: '5', image: TImages.oldphonecate, name: 'ĐT', isFeatures: true),
  CategoryModel(id: '2', image: TImages.oldphone2, name: 'ĐTĐB', isFeatures: true),
  CategoryModel(id: '3', image: TImages.headphonePC, name: 'Tai nghe máy tính', isFeatures: true),
  CategoryModel(id: '4', image: TImages.headphone1, name: 'Tai nghe chùm tai', isFeatures: true),
  CategoryModel(id: '6', image: TImages.earbudkoday, name: 'Tai nghe bluetooth', isFeatures: true),
  CategoryModel(id: '7', image: TImages.earbudcoday, name: 'Tai nghe có dây', isFeatures: true),
  CategoryModel(id: '14', image: TImages.speaker, name: 'Loa', isFeatures: true),

  CategoryModel(id: '15', image: TImages.karaoke, name: 'Loa Karaoke', isFeatures: true),
];
}