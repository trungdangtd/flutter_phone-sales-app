import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/device/device_utility.dart';

// ignore: camel_case_types
class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.Instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
