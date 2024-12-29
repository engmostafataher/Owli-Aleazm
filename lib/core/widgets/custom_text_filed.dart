import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      @required this.inputType,
      this.suffexIcon,
      this.onSaved,
      this.onChanged,
      this.prefixIcon,
      this.hintText,
      required this.obscureText, this.controller});
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? suffexIcon;
  final Widget? prefixIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final String? hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.right,
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: suffexIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xffCCCCCC)))),
        obscureText: obscureText,
      ),
    );
  }
}
