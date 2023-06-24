import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/finance_sum_model.dart';
import 'package:money_app_mobile/app/data/providers/base_provider.dart';

import '../models/finance_model.dart';

class FinanceProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Finance?>> getFinances() async {
    try {
      final response = await get('finances');
      if (response.body["success"]) {
        List<dynamic> data = response.body['data'];
        List<Finance> financeList = data
          .map((json) => Finance.fromJson(json)).toList();
        return financeList;
      } else {
        throw Exception({"message": response.body["message"]});
      }
    } catch (e) {
      throw e;
    }
  }

  Future<FinanceSum?> getFinancesSum() async {
    try{
      final response = await get('finances/sum');
      if (response.body["success"]) {
        return FinanceSum.fromJson(response.body["data"]);
      } else {
        throw Exception({"message": response.body["message"]});
      }
    }catch (e){
      throw e;
    }
  }

  Future<Finance?> getFinance(int id) async {
    final response = await get('finances/$id');
    return response.body;
  }

  Future<Response<Finance>> postFinance(Finance finance) async =>
      await post('finances', finance);
  Future<Response> deleteFinance(int id) async => await delete('finances/$id');
}
