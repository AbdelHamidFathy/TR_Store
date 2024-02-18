import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (c) {
        if (c.cartList.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 3.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: Strings.total,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                GetBuilder<CartController>(builder: (c) {
                  return CustomText(
                    text:
                        "\$${c.cartList.fold(0, (total, element) => total + element.price * element.quantity)}",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  );
                }),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
