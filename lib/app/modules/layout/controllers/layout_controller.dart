import 'package:get/get.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController

  final count = 0.obs;
  RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void onDestinationSelected(int index) {
    _selectedIndex.value = index;
  }

  void increment() => count.value++;
}
