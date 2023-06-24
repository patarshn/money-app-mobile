import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/finance_model.dart';
import 'package:money_app_mobile/app/data/models/finance_sum_model.dart';
import 'package:money_app_mobile/app/data/providers/finance_provider.dart';
import 'package:money_app_mobile/app/modules/finance/views/finance_list_bulder.dart';

class FinanceController extends GetxController{
  FinanceProvider financeProvider = Get.put(FinanceProvider());
  RxList<Finance?> finances = RxList<Finance?>();
  Rx<FinanceSum?> financeSum = Rx<FinanceSum?>(null);
  RxBool financesSumLoading = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    getFinances();
    getFinancesSum();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    getFinances();
    getFinancesSum();
  }

  Widget get financeListBuilder {
    if (finances.isNotEmpty) {
      return FinanceListBuilder(items: finances);
    }
    return const Text("Loading");
  }

  void getFinances() async {
    try {
      finances.value = await financeProvider.getFinances();
    } catch (e) {
      Get.snackbar("Error Get Finance", e.toString());
    }
  }
  

  void getFinancesSum() async {
    financesSumLoading(true);
    try{
      financeSum.value = await financeProvider.getFinancesSum();
    }catch(e){
      Get.snackbar("Error Get Finance Sum", e.toString());
    }
    financesSumLoading(false);
  }
  



}
