import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/text/section_heading.dart';
import 'package:flutter_store_mobile/features/shop/controller/address_controller.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionWidget(
            title: 'Địa chỉ giao hàng',
            buttonTitle: 'thay đổi',
            onPressed: () async {
              addressController.selectNewAddressPopup(context);
            }),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hoàng A Trung',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text('0999113114',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text('113/114 Bún thịt nướng,Mai Hoàng Ngủ,VN',
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true),
                    ],
                  ),
                ],
              )
            : Text(
                'Chọn địa chỉ',
                style: Theme.of(context).textTheme.bodyMedium,
              )
      ],
    );
  }
}
