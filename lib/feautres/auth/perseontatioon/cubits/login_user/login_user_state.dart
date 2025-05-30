part of 'login_user_cubit.dart';

@immutable
sealed class LoginUserState {}

final class LoginUserInitial extends LoginUserState {}

final class LoginUserLoading extends LoginUserState {}

final class LoginUserSuccess extends LoginUserState {
  final UserEntities user;

  LoginUserSuccess({required this.user});
}

final class LoginUserFailures extends LoginUserState {
  final String message;

  LoginUserFailures({required this.message});
}
