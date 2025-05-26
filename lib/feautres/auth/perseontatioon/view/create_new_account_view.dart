import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/servers/get_it_servers.dart';
import 'package:fruit_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/feautres/auth/perseontatioon/cubits/create_new_user/create_new_user_cubit.dart';

import '../widgets/create_new_Account_body_cubit.dart';

class CreateNewAccountView extends StatelessWidget {
  const CreateNewAccountView({super.key});
  static const String routeName = '/newAccount';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewUserCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "حساب جديد"),
        body: const CreateNewAccountBodyCubit(),
      ),
    );
  }
}
