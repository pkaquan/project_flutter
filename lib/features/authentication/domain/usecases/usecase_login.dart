import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure_handle.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

class UseCaseLogin {
  final AuthRepositories _authRepositories;
  UseCaseLogin(this._authRepositories);
  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    return await _authRepositories.login(email, password);
  }
}
