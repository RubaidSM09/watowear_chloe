import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextFiled({
    this.controller,
    this.padding,
    this.hintText,
    this.hintStyle,
    this.border,
    this.suffixIcon,
    this.obscureText = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        contentPadding: padding,
        hintText: hintText,
        hintStyle: hintStyle,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: suffixIcon,
      ),

      obscureText: obscureText,
    );
  }
}
