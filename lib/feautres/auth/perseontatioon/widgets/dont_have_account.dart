import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/color_app.dart';

class DontHaveCounts extends StatelessWidget {
  const DontHaveCounts(
      {super.key,
      required this.firstTitle,
      this.onTap,
      required this.scendTitle});
  final String firstTitle;
  final String scendTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstTitle,
          style: AppTextStyle.bold16.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            scendTitle,
            style: AppTextStyle.bold16.copyWith(color: ColorApp.primary),
          ),
        ),
      ],
    );
  }
}
