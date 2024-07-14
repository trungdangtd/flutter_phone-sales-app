import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/image_text/vertical_image_text.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';

class THomeBrands extends StatelessWidget {
  const THomeBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
              image: TImages.appleLogo, title: 'Apple', onTap: () {});
        },
      ),
    );
  }
}
