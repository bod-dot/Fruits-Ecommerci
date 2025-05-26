import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failuers.dart';
import 'package:fruit_e_commerce/core/servers/firebase_auth_server.dart';
import 'package:fruit_e_commerce/feautres/auth/data/models/user_model.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/core/errors/exception.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServer firebaseAuthServer;

  AuthRepoImpl({required this.firebaseAuthServer});

  @override
  Future<Either<Failures, UserEntities>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthServer.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return Left(ServerFailures(message: e.message));
    } catch (e) {
      log('exception: AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailures(message: 'يوجد خطاء يرجاء المحاولة لاحقا'));
    }
  }
}
