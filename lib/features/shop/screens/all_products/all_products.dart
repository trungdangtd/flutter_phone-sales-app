import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_mobile/common/widgets/appbar/appbar.dart';
import 'package:flutter_store_mobile/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_store_mobile/features/shop/controller/all_product_controller.dart';
import 'package:flutter_store_mobile/features/shop/models/product_model.dart';
import 'package:flutter_store_mobile/utils/constants/sizes.dart';
import 'package:flutter_store_mobile/utils/helpers/could_helper_function.dart';
import 'package:flutter_store_mobile/utils/helpers/vertical_product_shimmer.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethods});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethods;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethods ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                if(widget !=null) return widget;
                final products = snapshot.data!;
                return TSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
