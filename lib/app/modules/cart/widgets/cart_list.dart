import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/app/modules/cart/widgets/cart_item.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';
import 'package:tr_store/common/widgets/vertical_space.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (c) {
      if (c.cartList.isNotEmpty) {
        return ListView.separated(
          itemBuilder: (context, index) {
            var cartItem = c.cartList[index];
            return CartItem(
              image: cartItem.image,
              title: cartItem.title,
              price: cartItem.price,
              quantity: cartItem.quantity,
              id: cartItem.id,
            );
          },
          separatorBuilder: (context, index) => const VerticalSpace(),
          itemCount: c.cartList.length,
        );
      } else {
        return Center(
          child: CustomText(
            text: Strings.yourCartIsEmpty,
            fontSize: 13.sp,
            fontColor: Colors.grey,
          ),
        );
      }
    });
  }
}
