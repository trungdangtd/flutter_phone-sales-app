import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shape/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Hãng với  số sản phẩm
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),
          //Hãng với top 3 hình ảnh sản phẩm
          Row(
            children: images
                .map((images) => brandTopProductImageWidget(images, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: TRoundedContainer(
    height: 100,
    backgroundColor:
        THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
    margin: const EdgeInsets.only(right: TSizes.sm),
    padding: const EdgeInsets.all(TSizes.md),
    child: Image(fit: BoxFit.contain, image: AssetImage(image)),
  ));
}
