import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failuers.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failures, UserEntities>> createUserWithEmailAndPasswrod() {
    // TODO: implement createUserWithEmailAndPasswrod
    throw UnimplementedError();
  }
}
