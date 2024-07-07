import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/shop/screens/home/home.dart';
import 'package:flutter_store_mobile/features/shop/screens/store/store.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Trang Chủ"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Mua Sắm"),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: "Yêu Thích"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Hồ Sơ"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(),
    Container(color: Colors.orange),
    Container(color: Colors.blue)
  ];
}
