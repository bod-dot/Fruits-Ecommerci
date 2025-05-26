import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomPasswordTextFiled extends StatefulWidget {
  const CustomPasswordTextFiled({
    super.key,
    required this.onSaved,
  });
  final void Function(String?) onSaved;

  @override
  State<CustomPasswordTextFiled> createState() =>
      _CustomPasswordTextFiledState();
}

class _CustomPasswordTextFiledState extends State<CustomPasswordTextFiled> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      suffix: GestureDetector(
        onTap: () {
          isObscure = !isObscure;
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: isObscure
              ? const Icon(
                  Icons.visibility,
                  color: Color(0xffC9CECF),
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Color(0xffC9CECF),
                ),
        ),
      ),
      hit: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
