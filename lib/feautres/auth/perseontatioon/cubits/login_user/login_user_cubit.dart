import 'package:bloc/bloc.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entites.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.authRepo) : super(LoginUserInitial());
  AuthRepo authRepo;
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginUserLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginUserFailures(message: failure.message)),
      (user) => emit(LoginUserSuccess(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginUserLoading());
    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(LoginUserFailures(message: failure.message)),
      (user) => emit(LoginUserSuccess(user: user)),
    );
  }
}
