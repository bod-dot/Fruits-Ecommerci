import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/widgets/custom_buttom.dart';
import 'package:fruit_e_commerce/core/widgets/custom_text.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/dont_have_account.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/terms_checkbox.dart';

import '../../../../core/helper_function/snak_bar.dart';
import '../../../../core/widgets/custom_password_text_filed.dart';
import '../cubits/create_new_user/create_new_user_cubit.dart';

class CreateNewAccountBody extends StatefulWidget {
  const CreateNewAccountBody({super.key});

  @override
  State<CreateNewAccountBody> createState() => _CreateNewAccountBodyState();
}

class _CreateNewAccountBodyState extends State<CreateNewAccountBody> {
  bool isAgra = false;
  String? name, email, password;
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
            children: [
              CustomText(
                onSaved: (value) {
                  name = value;
                },
                hit: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomText(
                onSaved: (value) {
                  email = value;
                },
                hit: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordTextFiled(
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsCheckbox(
                isAgra: isAgra,
                onChanged: (value) {
                  isAgra = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isAgra) {
                        formKey.currentState!.save();
                        BlocProvider.of<CreateNewUserCubit>(context)
                            .createNewUser(
                          email: email!,
                          password: password!,
                          name: name!,
                        );
                      } else {
                        buildErrorSankBar(
                          context,
                          'يجب الموافقة على الشروط والأحكام',
                        );
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'إنشاء حساب جديد'),
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
      ),
    );
  }
}
