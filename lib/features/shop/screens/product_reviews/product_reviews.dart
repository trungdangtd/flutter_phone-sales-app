import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: const TAppBar(
          title: Text('Nhận xét và Đánh giá'), showBackArrow: true),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Đánh giá"),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Chỉ số đánh giá
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5),
              Text('10,000', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Lời nhận xét
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
