import 'package:dartz/dartz.dart';
import 'package:fruit_app/Core/Errors/failurs.dart';
import 'package:fruit_app/Features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failurs, UserEntity>> createAccountWithEmailAndPass({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failurs, UserEntity>> signInWithEmailAndPass({
    required String email,
    required String password,
  });
  Future<Either<Failurs, UserEntity>> signInWithGoogle();
  Future<Either<Failurs, UserEntity>> signInWithFacebook();
  Future addUser({required UserEntity user});
  Future getUserData({required String userId});
}
