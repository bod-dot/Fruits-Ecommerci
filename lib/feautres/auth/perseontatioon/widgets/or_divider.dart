import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

Row orDivider() {
  return const Row(
    children: [
      Expanded(
        child: Divider(
          height: 20,
          endIndent: 20,
          thickness: 1.9,
          color: Color(0xffDDDFDF),
        ),
      ),
      Text(
        'أو',
        style: AppTextStyle.bold16,
      ),
      Expanded(
        child: Divider(
          indent: 20,
          thickness: 1.9,
          color: Color(0xffDDDFDF),
        ),
      ),
    ],
  );
}
