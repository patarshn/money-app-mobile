import 'package:get/get.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController

  final count = 0.obs;
  RxInt selectedIndex = 0.obs;

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
    selectedIndex.value = index;
  }

}
