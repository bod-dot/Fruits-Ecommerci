import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/helper_function/shared_preferences.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/view/login_view.dart';
import 'package:fruit_e_commerce/feautres/on_bording/perseontation/views/on_bording.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    excutNavigtor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imageTree),
          ],
        ),
        SvgPicture.asset(Assets.imageAppIconSvg),
        SvgPicture.asset(
          Assets.imageSplashButtom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excutNavigtor() {
    bool isOnBordingseen = Shared.getBool(kIsOnbordingSeen);
    Future.delayed(const Duration(seconds: 2), () async {
      if (isOnBordingseen) {
        await Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        await Navigator.pushReplacementNamed(context, OnBordingView.routeName);
      }
    });
  }
}
