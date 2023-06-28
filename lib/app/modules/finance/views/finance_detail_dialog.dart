import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/finance_model.dart';

class FinanceDetailDialog extends GetView {
  final Finance? items;

  const FinanceDetailDialog({
    super.key,
    required this.items,  
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Detail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Text("ID: ${items?.sId}"),
                    // Text("Name: ${items?.name}"),
                    // Text("Date: ${items?.date}"),
                    // Text("Nominal: ${items?.nominal}"),
                    // Text("Source: ${items?.source}"),
                    // Text("Category: ${items?.category}"),
                    // Text("Type: ${items?.type}"),
                    // Text("Description: ${items?.description}"),
                    // Text("Created at:${items?.createdAt}"),
                    Table(
                      // border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: IntrinsicColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        customTableRow("ID", "${items?.sId}"),
                        customTableRow("Name", "${items?.name}"),
                        customTableRow("Date", "${items?.date}"),
                        customTableRow("Nominal", "${items?.nominal}"),
                        customTableRow("Source", "${items?.source}"),
                        customTableRow("Category", "${items?.category}"),
                        customTableRow("Type", "${items?.type}"),
                        customTableRow("Description", "${items?.description}"),
                        customTableRow("Created", "${items?.createdAt}"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            );
  }
}

TableRow customTableRow(title, value){
  return TableRow(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Text(title, 
            style: const TextStyle(fontWeight: FontWeight.bold)
            )
          ),
        Container(
          padding: EdgeInsets.all(5),
          child: const Text(":")
          ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text(value)
          ),
      ],
    );
}



