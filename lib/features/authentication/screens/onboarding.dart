import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/constants/text_string.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  Image(
                      width: THelperFunctions.screenWidth() * 0.8,
                      height: THelperFunctions.screenHeight() * 0.6,
                      image: const AssetImage(TImages.onBoardingImage1)),
                  Text(
                    TTexts.onBoardingTitle1,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Text(
                    TTexts.onBoardingSubTitle1,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
