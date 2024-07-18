import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/loader/animation_loader.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? TColors.dark
                    : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    TAnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              ),
            )
          );
  }

  static stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
