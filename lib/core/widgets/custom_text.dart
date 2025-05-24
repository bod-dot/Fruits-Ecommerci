import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.hit,
      this.suffix,
      this.keyboardType,
      this.obscureText});
  final String hit;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          suffixIcon: suffix,
          hintText: hit,
          enabledBorder: enableBorder(),
          focusedBorder: enableBorder()),
    );
  }

  OutlineInputBorder enableBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xff949D9E)),
        borderRadius: BorderRadius.circular(8));
  }
}
