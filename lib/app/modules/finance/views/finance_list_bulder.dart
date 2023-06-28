import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:money_app_mobile/app/data/models/finance_model.dart';
import 'package:money_app_mobile/app/modules/finance/controllers/finance_controller.dart';
import 'package:money_app_mobile/app/modules/finance/views/finance_add_view.dart';
import 'package:money_app_mobile/app/modules/finance/views/finance_detail_dialog.dart';

class FinanceListBuilder extends GetWidget<FinanceController> {
  final List<Finance?> items;

  const FinanceListBuilder({
    super.key,
    required this.items,  
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${items[index]?.type}"),
                              Text("${items[index]?.source}"),
                              Text("${items[index]?.category}"),
                            ],
                          )
                          ),
                          Text("${items[index]?.nominal}"),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => controller.showAddDialog(context,items[index])
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
