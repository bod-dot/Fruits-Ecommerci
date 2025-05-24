import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/feautres/on_bording/perseontation/widgets/page_view_item.dart';

import '../../../../core/utils/app_text_style.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isSkipButtonVisible: true,
            backgroundImage: Assets.imagePageViewItem1BackgroundImage,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مرحبًا بك في ',
                  style: AppTextStyle.bold23,
                ),
                Text(
                  'HUB',
                  style: AppTextStyle.bold23.copyWith(color: ColorApp.secander),
                ),
                Text(
                  'Fruit',
                  style: AppTextStyle.bold23.copyWith(color: ColorApp.primary),
                ),
              ],
            ),
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            image: Assets.imagePageViewItem1Image),
        const PageViewItem(
            isSkipButtonVisible: false,
            backgroundImage: Assets.imagePageViewItem2BackgroundImage,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ابحث وتسوق',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subTitle:
                "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            image: Assets.imagePageViewItem2Image),
      ],
    );
  }
}
