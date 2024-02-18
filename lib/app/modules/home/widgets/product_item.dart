import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/models/product.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';
import 'package:tr_store/common/widgets/custom_text.dart';

class ProductItem extends GetView<HomeController> {
  const ProductItem(
      {required this.product, required this.productIndex, super.key});
  final Product product;
  final int productIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          controller.navigateToProductDetails(productIndex: productIndex),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 26.h,
            child: Stack(
              children: [
                Container(
                  height: 24.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Image(
                    image: NetworkImage(
                      '${product.thumbnail}',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      if (Get.find<CartController>()
                          .cartList
                          .any((element) => element.price == product.userId)) {
                        Get.find<CartController>()
                            .deleteFromCart(productId: product.id!);
                      } else {
                        Get.find<CartController>().addToCart(
                          title: product.title!,
                          price: product.userId!,
                          image: product.image!,
                          description: product.content!,
                          quantity: 1,
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 3.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.w,
                        vertical: 1.w,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.w,
                          vertical: 1.w,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: GetBuilder<CartController>(builder: (context) {
                          if (Get.find<CartController>().cartList.any(
                              (element) => element.price == product.id)) {
                            return const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            );
                          } else {
                            return const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomText(
            text: "\$${product.userId}",
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: product.title!,
            fontSize: 13.sp,
            maxLines: 1,
            fontColor: Colors.black.withOpacity(0.5),
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
