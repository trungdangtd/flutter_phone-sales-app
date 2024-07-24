import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/constants/shimmer.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
