import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tr_store/app/modules/home/controller/home_controller.dart';
import 'package:tr_store/app/modules/home/widgets/home_app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) => controller.back(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            Obx(() {
              return Expanded(
                child: controller.views[controller.currentPageIndex.value],
              );
            }),
          ],
        ),
      ),
    );
  }
}
