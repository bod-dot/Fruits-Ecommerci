import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/helper_function/shared_preferences.dart';
import 'package:fruit_e_commerce/core/utils/app_text_style.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/view/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.backgroundImage,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.isSkipButtonVisible});
  final String backgroundImage;
  final String image;
  final Widget title;
  final String subTitle;
  final bool isSkipButtonVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isSkipButtonVisible,
                child: GestureDetector(
                  onTap: () {
                    Shared.setBool(kIsOnbordingSeen, true);
                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'تخطي',
                      style: AppTextStyle.bold13
                          .copyWith(color: ColorApp.greeColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular11.copyWith(
              color: ColorApp.greeColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
