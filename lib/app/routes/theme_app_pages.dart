import 'package:get/get.dart';
import 'package:tr_store/app/modules/cart/bindings/cart_bindings.dart';
import 'package:tr_store/app/modules/cart/views/cart_view.dart';
import 'package:tr_store/app/modules/home/bindings/home_bindings.dart';
import 'package:tr_store/app/modules/home/views/home_view.dart';
import 'package:tr_store/app/routes/app_routes.dart';

class ThemeAppPages {
  static final routes = [
    GetPage(
      name: Routes.homeLayout,
      page: () => const HomeView(),
      binding: HomeBindings(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => const CartView(),
      binding: CartBindings(),
    ),
  ];
}
