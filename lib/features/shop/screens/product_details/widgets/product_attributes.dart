import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/text/product_price_text.dart';
import 'package:flutter_store_mobile/common/widgets/text/product_title_text.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/controller/variation_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_function.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const TSectionWidget(
                          title: 'Loại', showActionbutton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                  title: 'Giá: ', smallSize: true),
      
                              //Giá thật
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                
                                '\$${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
      
                              //Giá bán
                               TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(
                                  title: 'Kho: ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
      
                  ///Chi tiết
                  const TProductTitleText(
                    title:
                        'Đây là thông tin chi tiết sản phẩm ajsdhjahdjkashdj có thể lên tới 4 dòng',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),
          //
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionWidget(
                            title: attribute.name ?? '', showActionbutton: false),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map(
                                (attributesValue) {
                                  final isSelected = controller
                                          .selectedAttributes[attribute.name!] ==
                                      attributesValue;
                                  final avalable = controller
                                      .getAttributesAvailabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(attributesValue);
                                  return TChoiceChip(
                                      text: attributesValue,
                                      selected: isSelected,
                                      onSelected: avalable
                                          ? (selected) {
                                              if (isSelected && avalable) {
                                                controller.onAttributeSelected(
                                                    product,
                                                    attribute.name ?? '',
                                                    attributesValue);
                                              }
                                            }
                                          : null);
                                },
                              ).toList()),
                        )
                      ],
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
