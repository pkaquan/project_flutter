import 'package:projectiot/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_handle.dart';

abstract class AuthRepositories {
  Future <Either<Failure, UserEntity>> login (String email, String password);
  Future <Either<Failure, UserEntity>> register (String email, String password);
  Future <void> sendVerificationEmail ();
  Future <void> resetPassword (String email);
  Future <void> logOut ();
  Stream <UserEntity?> authChangeState ();
}