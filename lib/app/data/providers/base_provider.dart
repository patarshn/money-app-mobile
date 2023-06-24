import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseProvider extends GetConnect {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String token;

  @override
  void onInit() async {
    super.onInit();
    httpClient.baseUrl = 'http://172.30.16.1:3000/api/v1/';

    final sharedPreferences = await prefs;
    token = sharedPreferences.getString('token') ?? '';
    
    httpClient.addAuthenticator((Request request) async {
      request.headers['Authorization'] = token;
      return request;
    });
    
    httpClient.addResponseModifier((request, response) async {
      print(response.body);
      return response;
    });

    httpClient.maxAuthRetries = 3;

    print("INITIAL BaseProvider");
  }

  Future<SharedPreferences> get prefs async {
    return _prefs;
  }
}

