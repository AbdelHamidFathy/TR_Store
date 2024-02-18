import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';
import 'package:tr_store/app/routes/app_routes.dart';
import 'package:tr_store/common/app_colors.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.w,
        ),
        child: Row(
          children: [
            Obx(() {
              if (controller.currentPageIndex.value == 1) {
                return IconButton(
                  onPressed: () => controller.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            Text.rich(
              TextSpan(
                text: Strings.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: AppColors.primary,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: Strings.store,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GetBuilder<CartController>(builder: (c) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () => Get.toNamed(Routes.cartScreen),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    color: Colors.black,
                  ),
                  if (c.cartList.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.9.w,
                        horizontal: 0.9.w,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: CustomText(
                        text: c.cartList
                            .fold(0, (sum, element) => sum + element.quantity)
                            .toString(),
                        fontSize: 8.sp,
                        fontColor: Colors.white,
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
