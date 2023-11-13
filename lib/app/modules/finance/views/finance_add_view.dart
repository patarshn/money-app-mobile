import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app_mobile/app/modules/finance/controllers/finance_controller.dart';
import 'package:money_app_mobile/app/widgets/custom_text_form_field_widget.dart';

class FinanceAddView extends GetView<FinanceController> {
  const FinanceAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.financeFormKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                labelText: "Name",
                hintText: "Input Your Text",
                controller: controller.name
              ),
              // CustomTextFormField(
              //   labelText: "Date",
              //   hintText: "Input Your Text",
              // ),
              // CustomTextFormField(
              //   labelText: "Nominal",
              //   hintText: "Input Your Text",
              // ),
              // CustomTextFormField(
              //   labelText: "Description",
              //   hintText: "Input Your Text",
              // ),
              // CustomTextFormField(
              //   labelText: "Source",
              //   hintText: "Input Your Text",
              // ),CustomTextFormField(
              //   labelText: "Category",
              //   hintText: "Input Your Text",
              // ),CustomTextFormField(
              //   labelText: "Type",
              //   hintText: "Input Your Text",
              // ),
              SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: controller.onPressAdd,
                          // onPressed: (){},
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
          ],
          ),
        ),
      )
    );
  }
}
