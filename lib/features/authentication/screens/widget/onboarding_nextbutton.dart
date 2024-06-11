import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

// ignore: camel_case_types
class onboardingNextButton extends StatelessWidget {
  const onboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.Instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor:
              Colors.white, // Đổi màu nền của button thành màu trắng
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
          color: Colors.red,
          size: 20,
        ),
      ),
    );
  }
}