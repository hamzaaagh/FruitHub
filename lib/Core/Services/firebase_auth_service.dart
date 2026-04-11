import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/errors/exceptions.dart';

class FirebaseAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  Future<void> initGoogle() async {
    await _googleSignIn.initialize(
      serverClientId: 'YOUR_WEB_CLIENT_ID', // مهم للأندرويد
    );
  }

  Future<User> createAccountWithEmailAndPass({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "FirebaseAuthExceptionCreateEmailAndPassword: e.code : ${e.code} - ${e.message}",
      );
      if (e.code == 'network-request-failed') {
        throw CustomException(
          'لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.',
        );
      }
      if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException('عملية إنشاء الحساب غير مسموح بها');
      }
      if (e.code == 'weak-password') {
        throw CustomException('كلمة السر ضعيفة جدا ');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل');
      }
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة لاحقًا');
    } catch (e) {
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة ');
    }
  }

  Future<User> signInWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "FirebaseAuthExceptionSignInEmailAndPassword: e.code : ${e.code} - ${e.message}",
      );
      if (e.code == 'network-request-failed') {
        throw CustomException(
          'لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.',
        );
      }
      if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'user-disabled') {
        throw CustomException('الحساب معطل');
      }
      if (e.code == 'user-not-found') {
        throw CustomException('المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      }
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة لاحقًا');
    } catch (e) {
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة ');
    }
  }

  Future<User> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '689402195640-89rv4gmegf59t0d5ti87op96aaglvmr1.apps.googleusercontent.com',
    );
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return userCredential.user!;
  }
}
