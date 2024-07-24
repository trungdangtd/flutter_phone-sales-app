import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/images/rounded_image.dart';
import 'package:flutter_store_mobile/features/shop/models/cart_item.model.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';

import '../../../../utils/constants/colors.dart';
import '../../text/brand_title_text_verfied_icon.dart';
import '../../text/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hình ảnh
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
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
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: TProductTitleText(title: cartItem.title, maxLines: 1),
              ),
              //
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: ' ${e.key} ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: ' ${e.value} ',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
                              ],
                            )
                          ]))
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
