import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/utils/constants/shimmer.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount;
  @override
Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
            itemCount: itemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
            itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    /// Image
                    TShimerEffect(width: 120, height: 120),
                    SizedBox(width: TSizes.spaceBtwItems),

                    /// Text
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            SizedBox(height: TSizes.spaceBtwItems / 2),
                            TShimerEffect(width: 160, height: 15),
                            SizedBox(height: TSizes.spaceBtwItems / 2),
                            TShimerEffect(width: 110, height: 15),
                            SizedBox(height: TSizes.spaceBtwItems / 2),
                            TShimerEffect(width: 80, height: 15),
                            Spacer(),
                        ],
                    ),
                ],
            ),
        ),
    );
}

}
