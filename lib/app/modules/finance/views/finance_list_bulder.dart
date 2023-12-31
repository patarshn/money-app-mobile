import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:money_app_mobile/app/data/models/finance_model.dart';
import 'package:money_app_mobile/app/modules/finance/controllers/finance_controller.dart';

class FinanceListBuilder extends GetWidget<FinanceController> {
  final List<Finance?> items;

  const FinanceListBuilder({
    super.key,
    required this.items,  
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListView.builder(
          // padding: const EdgeInsets.all(8),
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: (){},
                  child: Padding(
                    padding: EdgeInsets.all(8),
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
                  ),
                ),
              ),
              );
          },
        ),
        SizedBox(height: 60,)
      ],
    );
  }
}
