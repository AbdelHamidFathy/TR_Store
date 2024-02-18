import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';
import 'package:tr_store/common/strings.dart';
import 'package:tr_store/common/widgets/custom_text.dart';
import 'package:tr_store/common/widgets/horizontal_space.dart';

class CartItem extends GetView<CartController> {
  const CartItem({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    required this.id,
    super.key,
  });
  final String image;
  final String title;
  final int price;
  final int quantity;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
              height: 25.w,
              width: 25.w,
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 12.sp,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "\$ ${price.toString()}",
                      fontSize: 15.sp,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const HorizontalSpace(),
                    OutlinedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                      ),
                      onPressed: () =>
                          controller.deleteFromCart(productId: price),
                      child: CustomText(
                        text: Strings.remove,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const HorizontalSpace(),
          Padding(
            padding: EdgeInsets.only(
              right: 3.w,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => controller.updateCart(
                    quantity: quantity + 1,
                    id: id,
                  ),
                  child: Container(
                    height: 7.w,
                    width: 7.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: CustomText(
                      text: "+",
                      fontSize: 17.sp,
                      fontColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                CustomText(
                  text: quantity.toString(),
                  fontSize: 13.sp,
                ),
                InkWell(
                  onTap: () {
                    if (quantity == 1) {
                      controller.deleteFromCart(productId: price);
                    } else {
                      controller.updateCart(
                        quantity: quantity - 1,
                        id: id,
                      );
                    }
                  },
                  child: Container(
                    height: 7.w,
                    width: 7.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: CustomText(
                      text: "-",
                      fontSize: 17.sp,
                      fontColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
