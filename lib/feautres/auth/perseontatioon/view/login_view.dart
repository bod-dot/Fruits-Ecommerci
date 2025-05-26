import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/login_view_body.dart';

import '../../../../core/widgets/build_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'تسجيل دخول', context: context),
      body: const LoginViewBody(),
    );
  }
}
