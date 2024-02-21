// custom_textfield.dart

import 'package:flutter/material.dart';
import '../../utils/app_constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({super.key, 
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      cursorColor: AppConstant.appTextColor,
      obscureText: obscureText,
      style: const TextStyle(color: AppConstant.appTextColor),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: AppConstant.appTextColor),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          borderSide: BorderSide(color: AppConstant.appTextColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          borderSide: BorderSide(color: AppConstant.appTextColor),
        ),
        label: Text(label, style: const TextStyle(color: AppConstant.appTextColor)),
        hintText: 'Enter Your $label',
        hintStyle: const TextStyle(
          color: AppConstant.appTextColor,
        ),
      ),
    );
  }
}
