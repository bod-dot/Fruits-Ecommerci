import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failuers.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntities>> createUserWithEmailAndPasswrod();
}
