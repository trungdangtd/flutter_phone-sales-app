import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutter_store_mobile/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_store_mobile/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_store_mobile/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutter_store_mobile/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_store_mobile/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_store_mobile/navigation_menu.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Thông tin đặt hàng',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Mã giảm giá
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Phần thanh toán
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //Giá
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Phương thức thabh toán
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Địa chỉ
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Thanh toán thành công!',
                    subTitle: 'Đơn hàng của bạn sẽ được giao tới sớm thôi!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Thanh Toán \$200')),
      ),
    );
  }
}
