import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app_mobile/app/modules/finance/views/finance_sum_widget.dart';

import '../controllers/finance_controller.dart';

class FinanceView extends GetView<FinanceController> {
  const FinanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FinanceView'),
      //   centerTitle: true,
      // ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => FinanceSumWidget(
                            title: "Pemasukan",
                            amount: controller.financeSum.value?.pemasukan,
                            gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.blue.shade900, Colors.blue])
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => FinanceSumWidget(
                            title: "Pengeluaran",
                            amount: controller.financeSum.value?.pengeluaran,
                            gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.red.shade900, Colors.red])
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: Obx(() => controller.financeListBuilder)
                ),
            ],
          ),
        ),
      ),
    );
  }
}