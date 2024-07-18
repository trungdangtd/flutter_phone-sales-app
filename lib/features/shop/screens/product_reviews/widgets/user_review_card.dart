import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:flutter_store_mobile/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_store_mobile/utils/constants/colors.dart';
import 'package:flutter_store_mobile/utils/constants/images_string.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/helpers/helper_function.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Nguyễn Thị Phô Mai',
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        //Nhận xét
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01/07/2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          "Giao diện người dùng rất đẹp tôi phải nói vậy, rất bắt mắt với người dùng, tôi có thể thao tác rất dễ dàng và mua món hàng 1 cách nhanh gọn lẹ. ",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Rút gọn',
          trimCollapsedText: 'Xem thêm',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        //Nhận xét của cty
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('5Tech Store',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('01/07/2024',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const ReadMoreText(
                  "Giao diện người dùng rất đẹp tôi phải nói vậy, rất bắt mắt với người dùng, tôi có thể thao tác rất dễ dàng và mua món hàng 1 cách nhanh gọn lẹ. ",
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Rút gọn',
                  trimCollapsedText: 'Xem thêm',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
