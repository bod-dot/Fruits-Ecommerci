import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/core/errors/failuers.dart';
import 'package:fruit_e_commerce/core/servers/database_server.dart';
import 'package:fruit_e_commerce/core/servers/firebase_auth_server.dart';
import 'package:fruit_e_commerce/core/utils/backend_end_point.dart';
import 'package:fruit_e_commerce/feautres/auth/data/models/user_model.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/core/errors/exception.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServer firebaseAuthServer;
  DatabaseServer databaseServer;

  AuthRepoImpl(
      {required this.firebaseAuthServer, required this.databaseServer});

  @override
  Future<Either<Failures, UserEntities>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthServer.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntities userModel =
          UserEntities(email: email, name: name, uId: user.uid);
      // Set the name in the user model
      addUserData(user: userModel);
      return Right(userModel);
    } on CustomException catch (e) {
      await deleteUser(user);

      return Left(ServerFailures(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('exception: AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailures(message: 'يوجد خطاء يرجاء المحاولة لاحقا'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServer.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntities>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await firebaseAuthServer.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var data = await getUserData(uId: user.uid);
      return Right(data);
    } on CustomException catch (e) {
      return Left(ServerFailures(message: e.message));
    } catch (e) {
      log('exception: AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailures(message: 'يوجد خطاء يرجاء المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failures, UserEntities>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServer.signInWithGoogle();
      UserEntities userModel = UserModel.fromFirebase(user);
      bool checkDataExits = await databaseServer.isDataExits(
          path: BackendEndPoint.checkDataExits, documentId: user.uid);
      if (checkDataExits) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }

      return Right(userModel);
    } catch (e) {
      await deleteUser(user);
      log('exception: AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailures(message: 'يوجد خطاء يرجاء المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failures, UserEntities>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServer.signInWithFacebook();
      UserEntities userModel = UserModel.fromFirebase(user);
      bool isUserExit = await databaseServer.isDataExits(
          path: BackendEndPoint.checkDataExits, documentId: userModel.uId);
      if (isUserExit) {
        getUserData(uId: user.uid);
      } else {
        await addUserData(user: userModel);
      }

      return Right(userModel);
    } on CustomException catch (e) {
      await deleteUser(user);

      return Left(ServerFailures(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('exception: AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailures(message: 'يوجد خطاء يرجاء المحاولة لاحقا'));
    }
  }

  @override
  Future addUserData({required UserEntities user}) async {
    await databaseServer.addData(
        path: BackendEndPoint.addUserData,
        data: user.toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntities> getUserData({required String uId}) async {
    var user = await databaseServer.getData(
        path: BackendEndPoint.getData, documentId: uId);
    return UserModel.fromJson(user);
  }
}
