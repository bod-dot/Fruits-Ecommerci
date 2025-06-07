import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_e_commerce/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(' exception: FirebaseAuthServer.signInWithEmailAndPassword: ${e.message} ,  ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة السر غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'خطأ في الاتصال بالانترنت');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: '  البريد الالكتروني او كلمة السر غير صحيح');
      } else {
        throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
      }
    } catch (e) {
      log(' exception: FirebaseAuthServer.signInWithEmailAndPassword: $e');
      throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(message: ' هذا الحساب مرتبط بحساب اخر');
      } else {
        throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
      }
    } catch (e) {
      log(' exception: FirebaseAuthServer.signInWithFacebook: $e');
      return throw CustomException(message: 'يوجد خطاء يرجاء المحاولة لاحقا');
    }
  }

  Future deleteUser() async {
    FirebaseAuth.instance.currentUser!.delete();
  }
}
