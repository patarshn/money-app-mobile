import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app_mobile/app/modules/home/views/home_view.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => [
        HomeView(),
        const Center(
          child: Text('Tiara', style: TextStyle(fontSize: 20),)
        ),
        ][controller.selectedIndex]
        ),
      bottomNavigationBar: Obx(() => 
        NavigationBar(destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: "Finance"),
          NavigationDestination(icon: Icon(Icons.explore), label: "Account"),
        ],
        selectedIndex: controller.selectedIndex,
        onDestinationSelected: controller.onDestinationSelected,
        ),
      )
    );
  }
}
