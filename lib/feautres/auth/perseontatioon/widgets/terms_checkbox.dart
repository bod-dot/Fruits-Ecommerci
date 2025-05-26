import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/color_app.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox(
      {super.key, required this.isAgra, required this.onChanged});
  final bool isAgra;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(12, 0),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(
                  color: Colors.white,
                )),
            value: isAgra,
            onChanged: (value) {
              onChanged(value!);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Transform.translate(
                offset: const Offset(12, 0),
                child: Text.rich(
                  TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                    style: AppTextStyle.bold13
                        .copyWith(color: const Color(0xff949D9E)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'الشروط والأحكام الخاصة بنا',
                        style: AppTextStyle.semiBold13.copyWith(
                            color: ColorApp
                                .lightPrimary), // Optional: You can style the link text
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
