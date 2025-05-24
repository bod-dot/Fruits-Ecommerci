import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_e_commerce/core/utils/app_text_style.dart';

class SocelLoginButton extends StatelessWidget {
  const SocelLoginButton(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.text});
  final Function() onPressed;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffDDDFDF)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(image),
          title: Text(
            text,
            style: AppTextStyle.semiBold16,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
