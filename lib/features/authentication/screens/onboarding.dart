import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_store_mobile/features/authentication/screens/widget/onboarding_nextbutton.dart';
import 'package:flutter_store_mobile/features/authentication/screens/widget/onboardingnavigation.dart';
import 'package:flutter_store_mobile/features/authentication/screens/widget/onboardingpage.dart';
import 'package:flutter_store_mobile/features/authentication/screens/widget/onboardingskip.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/text_string.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFff939b),
              Color(0xFFef2a39),
            ],
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                onBoardingPage(
                    image: TImages.onBoardingImage1,
                    title: TTexts.onBoardingTitle1,
                    subTitle: TTexts.onBoardingSubTitle1),
                onBoardingPage(
                    image: TImages.onBoardingImage2,
                    title: TTexts.onBoardingTitle2,
                    subTitle: TTexts.onBoardingSubTitle2),
                onBoardingPage(
                    image: TImages.onBoardingImage3,
                    title: TTexts.onBoardingTitle3,
                    subTitle: TTexts.onBoardingSubTitle3),
                onBoardingPage(
                    image: TImages.onBoardingImage4,
                    title: TTexts.onBoardingTitle4,
                    subTitle: TTexts.onBoardingSubTitle4),
              ],
            ),
            //skip button
            const onBoardingSkip(),
            //navigation
            const onBoardingNavigation(),
            //Circular button
            const onboardingNextButton(),
          ],
        ),
      ),
    );
  }
}
