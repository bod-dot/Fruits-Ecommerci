import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/view/create_new_account_view.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/view/login_view.dart';

import '../../feautres/on_bording/perseontation/views/on_bording.dart';
import '../../feautres/splash/presentation/spalsh_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
      );

    case OnBordingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBordingView(),
      );

    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
      );
    case CreateNewAccountView.routeName:
      return MaterialPageRoute(
        builder: (_) => const CreateNewAccountView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No route defined for '),
          ),
        ),
      );
  }
}
