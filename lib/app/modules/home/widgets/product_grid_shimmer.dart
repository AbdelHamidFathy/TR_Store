import 'package:flutter/material.dart';
import 'package:tr_store/app/modules/home/widgets/product_item_shimmer.dart';

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});
  final int itemCount = 6;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 15.0,
      childAspectRatio: 0.65,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        itemCount,
        (index) {
          return const ProductItemShimmer();
        },
      ),
    );
  }
}
