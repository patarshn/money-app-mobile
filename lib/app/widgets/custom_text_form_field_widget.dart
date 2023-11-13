import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField{
    final String? labelText;
    final String? hintText;
    final TextEditingController? controller;

    CustomTextFormField({
      super.key,
      this.labelText,
      this.hintText,
      this.controller
    });
    
  Widget build(BuildContext context){
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}