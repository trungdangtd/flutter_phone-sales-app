import 'package:flutter_store_mobile/features/shop/controller/variation_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/cart_item.model.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/constants/enums.dart';
import 'package:flutter_store_mobile/utils/local_storage/storage_utility.dart';
import 'package:flutter_store_mobile/utils/popups/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      TLoaders.customToost(message: 'Lựa chọn số lượng sản phẩm');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToost(message: 'Lựa chọn loại sản phẩm');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackbar(
            title: 'Hết hang', message: 'Sản phẩm đã hết hàng');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackbar(
            title: 'Hết hàng', message: 'Sản phẩm đã hết hàng');
        return;
      }
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToost(message: 'Đã thêm vào giỏ hàng');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price,
        quantity: quantity,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double caculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      caculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = caculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemString = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemString);
  }

  void loadCartItems() {
    final cartItemString =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemString != null) {
      cartItems.assignAll(cartItemString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Xoá sản phẩm',
      middleText: 'bạn có chắc là muốn xoá sản phẩm này?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToost(message: 'Sản phẩm đã được xoá khỏi giỏ hàng');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}
