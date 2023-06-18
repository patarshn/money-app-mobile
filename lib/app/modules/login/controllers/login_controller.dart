import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  RxBool isPasswordVisible = false.obs;
  String email = 'hellow@gmail.com';
  String password = '';
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

  void onPressedLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    print({email, password});
    loginFormKey.currentState!.save();
  }

}
