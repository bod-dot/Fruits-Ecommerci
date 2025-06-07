import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper_function/snak_bar.dart';
import '../cubits/create_new_user/create_new_user_cubit.dart';
import 'create_new_account_body.dart';

class CreateNewAccountBodyCubit extends StatelessWidget {
  const CreateNewAccountBodyCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewUserCubit, CreateNewUserState>(
      listener: (context, state) {
        if (state is CreateNewUserSuccess) {
          Navigator.pop(context);
          buildErrorSankBar(context, 'تم إنشاء الحساب بنجاح');
        } else if (state is CreateNewUserFailures) {
          buildErrorSankBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is CreateNewUserLading,
            child: const CreateNewAccountBody());
      },
    );
  }
}
