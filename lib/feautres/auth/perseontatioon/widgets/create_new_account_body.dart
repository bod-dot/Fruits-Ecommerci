import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_text_style.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:fruit_e_commerce/core/widgets/custom_buttom.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/dont_have_account.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/terms_checkbox.dart';

class CreateNewAccountBody extends StatefulWidget {
  const CreateNewAccountBody({super.key});

  @override
  State<CreateNewAccountBody> createState() => _CreateNewAccountBodyState();
}

class _CreateNewAccountBodyState extends State<CreateNewAccountBody> {
  bool isAgra = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomText(
              hit: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomText(
              hit: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomText(
              suffix: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.visibility,
                  color: Color(0xffC9CECF),
                ),
              ),
              hit: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 16,
            ),
            TermsCheckbox(
              isAgra: isAgra,
              onChange: (value) {
                isAgra = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            const SizedBox(
              height: 30,
            ),
            DontHaveCounts(
              firstTitle: 'تمتلك حساب بالفعل؟  ',
              scendTitle: 'تسجيل دخول',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
