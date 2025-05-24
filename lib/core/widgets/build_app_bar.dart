import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

AppBar bulidAppBar({required BuildContext context, required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios)),
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.bold19,
    ),
  );
}
