import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/models/payment_method_model.dart';
import 'package:flutter_store_mobile/features/shop/screens/store/payment_title.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'VNPay', image: TImages.vnPay);
    super.onInit();
  }

  Future<void> selectPaymentMethod(BuildContext context) async {
    final PaymentMethodModel? result =
        await showModalBottomSheet<PaymentMethodModel>(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionWidget(
                title: 'Lựa chọn phương thức thanh toán',
                showActionbutton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'VNPay',
                  image: TImages.vnPay,
                ),
                onTap: () => Navigator.pop(
                    context,
                    PaymentMethodModel(
                      name: 'VNPay',
                      image: TImages.vnPay,
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'ApplePay',
                  image: TImages.applePay,
                ),
                onTap: () => Navigator.pop(
                    context,
                    PaymentMethodModel(
                      name: 'ApplePay',
                      image: TImages.applePay,
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'GooglePay',
                  image: TImages.googlePay,
                ),
                onTap: () => Navigator.pop(
                    context,
                    PaymentMethodModel(
                      name: 'GooglePay',
                      image: TImages.googlePay,
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Visa',
                  image: TImages.visa,
                ),
                onTap: () => Navigator.pop(
                    context,
                    PaymentMethodModel(
                      name: 'Visa',
                      image: TImages.visa,
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Credit Card',
                  image: TImages.creditCard,
                ),
                onTap: () => Navigator.pop(
                    context,
                    PaymentMethodModel(
                      name: 'Credit Card',
                      image: TImages.creditCard,
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );

    // Cập nhật giá trị thanh toán đã chọn nếu có
    if (result != null) {
      selectedPaymentMethod.value = result;
    }
  }
}
