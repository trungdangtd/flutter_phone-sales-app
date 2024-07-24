import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/constants/shimmer.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                TShimerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                TShimerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
