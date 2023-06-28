import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:money_app_mobile/app/data/models/finance_model.dart';

class FinanceListBuilder extends GetWidget {
  final List<Finance?> items;

  const FinanceListBuilder({
    super.key,
    required this.items,  
  });
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
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
                Container(
                  width: Get.width - 16*4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: Get.width/2,
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
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
