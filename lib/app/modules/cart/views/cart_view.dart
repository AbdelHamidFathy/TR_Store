import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/widgets/cart_list.dart';
import 'package:tr_store/app/modules/cart/widgets/total_price.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TotalPrice(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  CustomText(
                    text: Strings.myCart,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const Expanded(child: CartList()),
          ],
        ),
      ),
    );
  }
}
