import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tr_store/app/models/product.dart';
import 'package:tr_store/app/modules/home/views/product_details_view.dart';
import 'package:tr_store/app/modules/home/views/products_view.dart';
import 'package:tr_store/app/repositories/home_repo.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final productsList = <Product>[].obs;
  final HomeRepo homeRepo = HomeRepo();
  final currentPageIndex = 0.obs;
  final selectedProductIndex = 0.obs;
  List<Widget> views = [
    const ProductsView(),
    const ProductDetailsView(),
  ];

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void navigateToProductDetails({required int productIndex}) {
    if (currentPageIndex.value == 0) {
      currentPageIndex.value = 1;
      selectedProductIndex.value = productIndex;
    }
  }

  void back() {
    if (currentPageIndex.value == 1) {
      currentPageIndex.value = 0;
    }
  }

  Future getProducts() async {
    try {
      isLoading.value = true;
      productsList.value = await homeRepo.getProducts();
    } catch (e) {
      Get.log('========== Error : ${e.toString()} ==========');
    } finally {
      isLoading.value = false;
    }
  }
}
