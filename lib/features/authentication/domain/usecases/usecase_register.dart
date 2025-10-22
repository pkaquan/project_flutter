import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_handle.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

class UseCaseRegister {
  final AuthRepositories _authRepositories;
  UseCaseRegister(this._authRepositories);
  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    final user = await _authRepositories.register(email, password);
    await _authRepositories.sendVerificationEmail();
    return user;
  }
}
