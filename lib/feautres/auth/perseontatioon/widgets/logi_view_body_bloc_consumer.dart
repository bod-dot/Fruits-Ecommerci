import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_function/snak_bar.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/login_view_body.dart';

import '../../../../core/widgets/custom_progress_hud.dart';
import '../../../home/presentation/views/home_view.dart';
import '../cubits/login_user/login_user_cubit.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) {
        if (state is LoginUserSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is LoginUserFailures) {
          buildErrorSankBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is LoginUserLoading,
            child: const LoginViewBody());
      },
    );
  }
}
