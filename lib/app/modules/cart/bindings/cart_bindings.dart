import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
