import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseProvider extends GetConnect {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<SharedPreferences> get prefs async {
    return _prefs;
  }

  final baseUrl = 'http://localhost:3000/api/v1/';


  @override
  void onInit() {
    super.onInit();
    _setupHttpClient();
  }

  void _setupHttpClient() {
    httpClient.baseUrl = baseUrl;
    httpClient.addAuthenticator(_authenticator);
    httpClient.addResponseModifier(_responseModifier);
  }

  FutureOr<Request> _authenticator(Request request) async {
    final SharedPreferences sharedPreferences = await prefs;
    final String? token = sharedPreferences.getString('token');
    if (token != null) {
      request.headers['Authorization'] = token;
    }
    return request;
  }

  FutureOr<Response> _responseModifier(Request request, Response response) async {
    print(response.body);
    return response;
  }

  
}
