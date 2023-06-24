import 'package:get/get.dart';
import 'package:money_app_mobile/app/modules/finance/controllers/finance_controller.dart';
import 'package:money_app_mobile/app/modules/home/controllers/home_controller.dart';

import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FinanceController>(
      () => FinanceController(),
    );
  }
}
