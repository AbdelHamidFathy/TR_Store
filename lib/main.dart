import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/controller/cart_controller.dart';

import 'my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}
