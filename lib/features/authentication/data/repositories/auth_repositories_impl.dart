import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectiot/core/errors/auth_error.dart';
import 'package:projectiot/core/errors/failure_handle.dart';
import 'package:projectiot/features/authentication/data/datasource/AuthRemoteDataSource.dart';
import 'package:projectiot/features/authentication/domain/entities/user_entity.dart';
import 'package:projectiot/features/authentication/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthDataSource _authDataSource;

  const AuthRepositoriesImpl(this._authDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await _authDataSource.login(email, password);
      if (await _authDataSource.verificationEmail() == true) {
        return Right(user.toEntity());
      } else {
        return Left(AuthError.verificationEmailError());
      }
    } on FirebaseAuthException catch (e) {
      return Left(AuthError.loginError(e.code));
    } catch (e) {
      return Left(AuthError.hashCodeUnknowException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
  ) async {
    try {
      final user = await _authDataSource.register(email, password);
      return Right(user.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(AuthError.registerError(e.code));
    } catch (e) {
      return Left(AuthError.hashCodeUnknowException(e.toString()));
    }
  }

  @override
  Future<void> sendVerificationEmail() async {
    await _authDataSource.sendVerificationEmail();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _authDataSource.resetPassword(email);
  }

  @override
  Future<void> logOut() async {
    await _authDataSource.logOut();
  }

  @override
  Stream<UserEntity?> authChangeState() {
    return _authDataSource.authChangeState();
  }
}
