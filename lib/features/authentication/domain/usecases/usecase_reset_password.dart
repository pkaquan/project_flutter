import '../repositories/auth_repositories.dart';

class UseCaseResetPassword {
  final AuthRepositories _authRepositories;
  UseCaseResetPassword(this._authRepositories);
  Future<void> call(String email) async {
    return await _authRepositories.resetPassword(email);
  }
}
