import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // ignore: non_constant_identifier_names
  static OnboardingController get Instance => Get.find();

  ///variable to store the current page index
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///update the current page index
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  ///jump to the next page
  void dotNavigation(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///update the current page index
  void nextPage() {
    if (currentPageIndex.value == 3) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
      // sang trang login
    }
  }

  ///update the current page index
  void skipPage() {
    currentPageIndex.value = 1;
    pageController.jumpToPage(4);
  }
}
