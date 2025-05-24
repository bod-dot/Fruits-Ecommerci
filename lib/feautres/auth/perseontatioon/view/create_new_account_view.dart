import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/create_new_account_body.dart';

class CreateNewAccountView extends StatelessWidget {
  const CreateNewAccountView({super.key});
  static const String routeName = '/newAccount';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidAppBar(context: context, title: "حساب جديد"),
      body: const CreateNewAccountBody(),
    );
  }
}
