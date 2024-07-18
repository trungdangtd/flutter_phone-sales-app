import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store_mobile/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Theo Tên',
            "Giá Cao",
            "Giá thấp",
            'Khuyến mãi',
            'Mới nhất',
            'Phổ biến'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///Sản phẩm
        TGridLayout(
            itemCount: 6,
            itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}
