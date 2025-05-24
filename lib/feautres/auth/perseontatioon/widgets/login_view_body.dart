import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_style.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/core/widgets/custom_buttom.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/socel_Login_button.dart';

import '../view/create_new_account_view.dart';
import 'dont_have_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomText(
              keyboardType: TextInputType.emailAddress,
              hit: 'البريد الإلكتروني',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomText(
              keyboardType: TextInputType.visiblePassword,
              suffix: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.visibility,
                  color: Color(0xffC9CECF),
                ),
              ),
              hit: 'كلمة المرور',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Text(
                'نسيت كلمة المرور؟',
                style:
                    AppTextStyle.bold13.copyWith(color: ColorApp.lightPrimary),
              ),
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(
              height: 30,
            ),
            DontHaveCounts(
              firstTitle: 'لا تمتلك حساب؟',
              scendTitle: 'قم بأنشاء حساب',
              onTap: () {
                Navigator.of(context).pushNamed(CreateNewAccountView.routeName);
              },
            ),
            const SizedBox(
              height: 33,
            ),
            orDivider(),
            const SizedBox(
              height: 18,
            ),
            SocelLoginButton(
                onPressed: () {},
                image: Assets.imageGoogleSocialIcons,
                text: "تسجيل بواسطة جوجل"),
            const SizedBox(
              height: 18,
            ),
            SocelLoginButton(
                onPressed: () {},
                image: Assets.imageAppleSocialIcons,
                text: 'تسجيل بواسطة أبل'),
            const SizedBox(
              height: 18,
            ),
            SocelLoginButton(
                onPressed: () {},
                image: Assets.imageFacebocckSocialIcons,
                text: 'تسجيل بواسطة فيسبوك'),
          ],
        ),
      ),
    );
  }
}
