import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/models/user_model.dart';
import 'package:money_app_mobile/app/data/providers/auth_provider.dart';
import 'package:money_app_mobile/app/data/providers/user_provider.dart';

class HomeController extends GetxController with StateMixin<User> {
  UserProvider userProvider = Get.put(UserProvider());
  AuthProvider authProvider = Get.put(AuthProvider());
  User? user;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfile() async {
    try {
      var response = await authProvider.getProfile("64887845315eceab30c46262");
      user = response;
      print(user?.toJson().toString());
      change(user, status: RxStatus.success());
    } catch (e) {
      if (e is Exception) {
      // Handle specific error message
      print(e);
    } else {
      // Handle generic error
      print("An error occurred while fetching the user data.");
    }
    change(null, status: RxStatus.error());
    }
  }

}
