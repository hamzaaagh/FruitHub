import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Core/Services/data_base_service.dart';
import 'package:fruit_app/Core/Services/firebase_auth_service.dart';
import 'package:fruit_app/Core/utils/backend_endpoints.dart';
import 'package:fruit_app/Features/Auth/Data/Models/user_model.dart';
import 'package:fruit_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/core/errors/exceptions.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImp({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });
  @override
  Future<Either<Failurs, UserEntity>> createAccountWithEmailAndPass({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createAccountWithEmailAndPass(
        name: name,
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, password: user.uid);
      await addUser(
        user: userEntity,
      ); // قم بإضافة المستخدم إلى قاعدة البيانات بعد تسجيل الدخول

      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteAccount(user);
      return Left(ServerFailurs(message: e.message));
    } catch (e) {
      log("Error in createAccountWithEmailAndPass: $e");
      await deleteAccount(user);
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }

  @override
  Future<Either<Failurs, UserEntity>> signInWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPass(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(userId: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailurs(message: e.message));
    } catch (e) {
      log("Error in signInWithEmailAndPass: $e");
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }

  @override
  Future<Either<Failurs, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFireBaseUser(user);
      bool isDocsExist = await dataBaseService.documentExists(
        path: BackendEndpoints.isDocsExist,
        documentId: user.uid,
      );
      if (isDocsExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUser(user: userEntity);
      }

      return Right(userEntity);
    } catch (e) {
      await deleteAccount(user);
      log("Error in signInWithGoogle: $e");
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }

  @override
  Future<Either<Failurs, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFireBaseUser(user);
      await addUser(
        user: userEntity,
      ); // قم بإضافة المستخدم إلى قاعدة البيانات بعد تسجيل الدخول
      return Right(userEntity);
    } catch (e) {
      await deleteAccount(user);
      log("Error in signInWithFacebook: $e");
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }

  @override
  Future addUser({required UserEntity user}) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoints.addUserData,
        data: user.toMap(),
        documentId: user.password,
      );
    } catch (e) {
      log("Error in addUser: $e");
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة لاحقًا');
    }
  }

  Future<void> deleteAccount(User? user) async {
    if (user != null) {
      // إذا تم إنشاء الحساب ولكن حدث خطأ في إضافة المستخدم إلى قاعدة البيانات، قم بحذف الحساب الذي تم إنشاؤه
      await firebaseAuthService.deleteAccount();
    }
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    try {
      var data = await dataBaseService.getData(
        path: BackendEndpoints.getUserData,
        documentId: userId,
      );
      return UserModel.fromMap(data);
    } catch (e) {
      log("Error in getUserData: $e");
      throw CustomException('حدث خطأ ما . يرجى إعادة المحاولة لاحقًا');
    }
  }
}
