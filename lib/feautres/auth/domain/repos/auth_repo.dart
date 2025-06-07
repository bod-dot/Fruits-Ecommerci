import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failuers.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntities>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<Either<Failures, UserEntities>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failures, UserEntities>> signInWithGoogle();
  Future addUserData({required UserEntities user});
  Future<UserEntities> getUserData({required String uId});
  Future<Either<Failures, UserEntities>> signInWithFacebook();
}
