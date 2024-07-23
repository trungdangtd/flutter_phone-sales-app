import 'package:flutter_store_mobile/features/shop/controller/variation_controller.dart';
import 'package:flutter_store_mobile/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
