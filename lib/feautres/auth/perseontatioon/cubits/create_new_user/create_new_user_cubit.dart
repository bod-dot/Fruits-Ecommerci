import 'package:bloc/bloc.dart';

import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entites.dart';

part 'create_new_user_state.dart';

class CreateNewUserCubit extends Cubit<CreateNewUserState> {
  CreateNewUserCubit(this.authRepo) : super(CreateNewUserInitial());

  final AuthRepo authRepo;

  Future<void> createNewUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(CreateNewUserLading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );

    result.fold(
      (failure) => emit(CreateNewUserFailures(message: failure.message)),
      (user) => emit(CreateNewUserSuccess(user: user)),
    );
  }
}
