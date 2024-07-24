import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/features/shop/controller/address_controller.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/validators/validators.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar:
          const TAppBar(showBackArrow: true, title: Text('Thêm địa chỉ mới')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validateEmptyText('Tên', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Tên')),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: TValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Số điện thoại')),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.sreet,
                            validator: (value) =>
                                TValidator.validateEmptyText('Đường', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: 'Đường'))),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            controller: controller.postalCode,
                            validator: (value) => TValidator.validateEmptyText(
                                'Mã bưu điện', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: 'Mã bưu điện'))),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.city,
                            validator: (value) => TValidator.validateEmptyText(
                                'Thành phố', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: 'Thành phố'))),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            controller: controller.state,
                            validator: (value) =>
                                TValidator.validateEmptyText('Tỉnh', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: 'Tỉnh'))),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.validateEmptyText('Quốc gia', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: 'Quốc gia')),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller.addNewAddresses();
                      },
                      child: const Text("Lưu")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
