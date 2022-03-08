import 'package:agc_conpany/themes/themes.dart';
import 'package:agc_conpany/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WidgetTextField extends StatelessWidget {
  String hintText;

  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon? endIcon;
  bool isPassword;

  WidgetTextField({
    required this.hintText,
    required this.inputType,
    required this.controller,
    required this.icon,
    this.endIcon,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon,
        suffixIcon: endIcon != null ? endIcon : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
}