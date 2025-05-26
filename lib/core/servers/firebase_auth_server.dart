import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/core/errors/exception.dart';

class FirebaseAuthServer {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(' exception: FirebaseAuthServer.createUserWithEmailAndPassword: ${e.message} ,  ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة السر ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'البريد الكتروني قد تم انشاء حساب مسبقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'خطأ في الاتصال بالانترنت');
      } else {
        throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
      }
    } catch (e) {
      log(' exception: FirebaseAuthServer.createUserWithEmailAndPassword: $e');
      throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
    }
  }
}
