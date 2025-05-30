import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_style.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/core/widgets/custom_buttom.dart';
import 'package:fruit_e_commerce/core/widgets/custom_password_text_filed.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/cubits/login_user/login_user_cubit.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/socel_Login_button.dart';

import '../view/create_new_account_view.dart';
import 'dont_have_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                onSaved: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                hit: 'البريد الإلكتروني',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordTextFiled(onSaved: (value) {
                password = value;
              }),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyle.bold13
                      .copyWith(color: ColorApp.lightPrimary),
                ),
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<LoginUserCubit>(context)
                          .loginUser(email: email!, password: password!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'تسجيل دخول'),
              const SizedBox(
                height: 30,
              ),
              DontHaveCounts(
                firstTitle: 'لا تمتلك حساب؟',
                scendTitle: 'قم بأنشاء حساب',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(CreateNewAccountView.routeName);
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
                  onPressed: () {
                    BlocProvider.of<LoginUserCubit>(context).loginWithGoogle();
                  },
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
      ),
    );
  }
}
