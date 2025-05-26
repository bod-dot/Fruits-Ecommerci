import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/feautres/auth/domain/entities/user_entites.dart';

class UserModel extends UserEntities {
  UserModel({required super.email, required super.name, required super.uId});
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }
}
