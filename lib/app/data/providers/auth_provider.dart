import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/user_model.dart';
import 'package:money_app_mobile/app/data/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  Future<dynamic> login(email, password) async {
    try{
      dynamic body = {
        'email': email,
        'password': password
      };
      final response = await post('login', body);
      if (response.body["success"]) {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          var token = response.body['data'];
          await sharedPreferences.setString("token", "Bearer $token");
          return true;
        } else {
          print("except");
          throw Exception({"message": response.body["message"]});
        }
      } catch (e) {
        print("cath : $e");
        throw e;
      }
    
    }


  Future<User?> getProfile() async {
    try {
      final response = await get('profile');

      if (response.body["success"]) {
        return User.fromJson(response.body["data"]);
      } else {
        throw Exception({"message": response.body["message"]});
      }
    } catch (e) {
      print('Error occurred: $e');

      if (e is Response) {
        final statusCode = e.statusCode;
        print('Response status code: $statusCode');
      }
      
      throw e;
    }
  }
 
  // Future<User?> getProfile() async {
  //   try {
  //     Response response = await httpClient.get('profile');
      

  //     if (response.body["success"]) {
  //       return User.fromJson(response.body["data"]);
  //     } else {
  //       throw Exception({"message": response.body["message"]});
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');

  //     if (e is Response) {
  //       final statusCode = e.statusCode;
  //       print('Response status code: $statusCode');
  //     }
      
  //     throw e;
  //   }
  // }


 // Future<User?> getProfile() async {
  //   try {
  //     print('here');
  //     final response = await get('profile');
  //     print(response.request?.headers);
  //     print(response.request?.url);
  //     print(response.statusCode);
  //     print(response.statusText);
  //     if (response.body["success"]) {
  //       return User.fromJson(response.body["data"]);
  //     } else {
  //       throw Exception({"message": response.body["message"]});
  //     }
  //   } catch (e) {
  //     throw "An error occurred while fetching the user data.";
  //   }
  // }
}
