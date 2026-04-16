import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Core/Services/firebase_auth_service.dart';
import 'package:fruit_app/Features/Auth/Data/Models/user_model.dart';
import 'package:fruit_app/Features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_app/Features/Auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/core/errors/exceptions.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImp(this.firebaseAuthService);
  @override
  Future<Either<Failurs, UserEntity>> createAccountWithEmailAndPass({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.createAccountWithEmailAndPass(
        name: name,
        email: email,
        password: password,
      );
      return Right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailurs(message: e.message));
    } catch (e) {
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }
  
  @override
  Future<Either<Failurs, UserEntity>> signInWithEmailAndPass({required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPass(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFireBaseUser(user));
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
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFireBaseUser(user));
    } catch (e) {
      log("Error in signInWithGoogle: $e");
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }
  
  @override
  Future<Either<Failurs, UserEntity>> signInWithFacebook() async {
    
    try {
      var user = await  firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFireBaseUser(user));
    } catch (e) {
      log("Error in signInWithFacebook: $e");
      return Left(
        ServerFailurs(message: 'حدث خطأ ما . يرجى إعادة المحاولة لاحقًا'),
      );
    }
  }
}
