import 'package:get/get.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}