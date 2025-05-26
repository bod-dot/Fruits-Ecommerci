part of 'create_new_user_cubit.dart';

@immutable
sealed class CreateNewUserState {}

final class CreateNewUserInitial extends CreateNewUserState {}

final class CreateNewUserLading extends CreateNewUserState {}

final class CreateNewUserSuccess extends CreateNewUserState {
  final UserEntities user;

  CreateNewUserSuccess({required this.user});
}

final class CreateNewUserFailures extends CreateNewUserState {
  final String message;
  CreateNewUserFailures({required this.message});
}
