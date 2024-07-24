import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/controller/checkout_controller.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionWidget(
          title: 'Phương thức thanh toán',
          buttonTitle: 'Thay đổi',
          onPressed: () async {
            await controller.selectPaymentMethod(context);
            // Có thể thực hiện thêm hành động sau khi chọn phương thức thanh toán
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
