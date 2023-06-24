import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app_mobile/app/modules/finance/views/finance_view.dart';
import 'package:money_app_mobile/app/modules/home/views/home_view.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Obx(() => [
        HomeView(),
        FinanceView()
        ][controller.selectedIndex.value]
        ),
      bottomNavigationBar: Obx(() => 
        NavigationBar(destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: "User"),
          NavigationDestination(icon: Icon(Icons.explore), label: "Finance"),
        ],
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: controller.onDestinationSelected,
        ),
      )
    );
  }
}
