import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/images/rounded_image.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../text/brand_title_text_verfied_icon.dart';
import '../../text/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hình ảnh
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        //Giá - tựa đề - kích cỡ
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Điện máy xanh'),
              const Flexible(
                child: TProductTitleText(
                    title: 'Tai nghe không dây màu da', maxLines: 1),
              ),
              //
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Màu ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Xanh ',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Kích cỡ ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '34 ',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
