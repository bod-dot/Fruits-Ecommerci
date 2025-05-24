import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/helper_function/shared_preferences.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/feautres/on_bording/perseontation/widgets/on_bording_page_view.dart';

import '../../../../core/widgets/custom_buttom.dart';
import '../../../auth/perseontatioon/view/login_view.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
        print(currentPage);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBordingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: ColorApp.primary,
              size: const Size(10, 10),
              activeSize: const Size(20, 10),
              color: currentPage == 1
                  ? ColorApp.primary
                  : ColorApp.primary.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kButtonPaddeing),
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: currentPage == 1 ? true : false,
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {
                Shared.setBool(kIsOnbordingSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
