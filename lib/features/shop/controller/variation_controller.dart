import 'package:flutter_store_mobile/features/shop/controller/cart_controller.dart';
import 'package:flutter_store_mobile/features/shop/controller/image_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/features/shop/models/product_variation_module.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// Select Attribute, and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariations = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());
    if (selectedVariations.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariations.image;
    }
    if (selectedVariations.id.isNotEmpty) {
      final cartCatroller = CartController.instance;
      cartCatroller.productQuantityInCart.value = cartCatroller
          .getVariationQuantityCart(product.id, selectedVariations.id);
    }
    selectedVariation.value = selectedVariations;
    getProductVariationStockStatus();
  }

  String getVariationPrice() {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    double price = selectedVariation.value.salePrice > 0
        ? selectedVariation.value.salePrice
        : selectedVariation.value.price;
    return currencyFormat.format(price);
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  /// Check Attribute availability / Stock in Variation
  // ignore: non_constant_identifier_names
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableAttributesVariation = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableAttributesVariation;
  }

  /// Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'Còn hàng' : 'Hết hàng';
  }

  /// Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
