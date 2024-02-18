import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';
import 'package:tr_store/common/app_colors.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';
import 'package:tr_store/common/widgets/vertical_space.dart';

class ProductDetailsView extends GetView<HomeController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(),
            CustomText(
              text: controller
                  .productsList[controller.selectedProductIndex.value].title!,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            const VerticalSpace(),
            Container(
              width: double.infinity,
              height: 50.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Image(
                image: NetworkImage(
                  controller.productsList[controller.selectedProductIndex.value]
                      .thumbnail!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            const VerticalSpace(),
            CustomText(
              text:
                  "\$${controller.productsList[controller.selectedProductIndex.value].userId}",
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
            const VerticalSpace(),
            CustomText(
              text: Strings.aboutThisItem,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 1.h,
            ),
            ReadMoreText(
              controller
                  .productsList[controller.selectedProductIndex.value].content!,
              trimMode: TrimMode.Length,
              trimCollapsedText: Strings.showMore,
              trimExpandedText: Strings.showLess,
              moreStyle:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
              lessStyle:
                  TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            const VerticalSpace(),
            GetBuilder<CartController>(builder: (c) {
              return InkWell(
                onTap: () {
                  if (c.cartList.any((element) =>
                      element.price ==
                      controller
                          .productsList[controller.selectedProductIndex.value]
                          .id)) {
                    c.deleteFromCart(
                        productId: controller
                            .productsList[controller.selectedProductIndex.value]
                            .id!);
                  } else {
                    c.addToCart(
                      title: controller
                          .productsList[controller.selectedProductIndex.value]
                          .title!,
                      price: controller
                          .productsList[controller.selectedProductIndex.value]
                          .userId!,
                      image: controller
                          .productsList[controller.selectedProductIndex.value]
                          .image!,
                      description: controller
                          .productsList[controller.selectedProductIndex.value]
                          .content!,
                      quantity: 1,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: CustomText(
                    text: c.cartList.any((element) =>
                            element.price ==
                            controller
                                .productsList[
                                    controller.selectedProductIndex.value]
                                .userId)
                        ? Strings.remove
                        : Strings.addToCart,
                    fontSize: 15.sp,
                    fontColor: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),
            const VerticalSpace(),
          ],
        ),
      ),
    );
  }
}
