import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app_mobile/app/data/providers/auth_provider.dart';
import 'package:money_app_mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  AuthProvider authProvider = Get.put(AuthProvider());
  RxBool isPasswordVisible = false.obs;
  String email = 'testing@gmail.com';
  String password = 'testing';
  // late TextEditingController emailController, passwordController;
  @override
  void onInit() {
    super.onInit();
    // emailController = TextEditingController();
    // passwordController = TextEditingController(); 
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // emailController.dispose();
    // passwordController.dispose();
  }

  String? validateEmail(value) {
    // add email validation
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }


  void onPressedPasswordVisible() => isPasswordVisible.value = ! isPasswordVisible.value;

  void onPressedLogin() async {
    try{
      final isValid = loginFormKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      dynamic isLogin = await authProvider.login(email, password);
      print(isLogin);
      if(isLogin == true){
        print("Login berhasil");
        Get.snackbar("Success", "Login Berhasil");
        Get.offAllNamed(Routes.LAYOUT);
      }
    } catch(e){
      Get.snackbar("test", e.toString());
    }
    loginFormKey.currentState!.save();
  }

}
