import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';
import 'package:tr_store/app/modules/home/widgets/product_item.dart';
import 'package:tr_store/app/modules/home/widgets/product_grid_shimmer.dart';

class ProductList extends GetView<HomeController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const ProductGridShimmer();
        } else {
          return GridView.count(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
            childAspectRatio: 0.65,
            crossAxisCount: 2,
            children: List.generate(
              controller.productsList.length,
              (index) {
                return ProductItem(
                  product: controller.productsList[index],
                  productIndex: index,
                );
              },
            ),
          );
        }
      }),
    );
  }
}
