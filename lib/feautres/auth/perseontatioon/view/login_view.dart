import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/cubits/login_user/login_user_cubit.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/widgets/login_view_body.dart';

import '../../../../core/servers/get_it_servers.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../widgets/logi_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'تسجيل دخول', context: context),
      body: BlocProvider(
        create: (context) => LoginUserCubit(
          getIt<AuthRepo>(),
        ),
        child: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
