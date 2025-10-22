import '../repositories/auth_repositories.dart';

class UseCaseSendVerificationEmail {
  final AuthRepositories _authRepositories;
  UseCaseSendVerificationEmail(this._authRepositories);
  Future<void> call() async {
    return await _authRepositories.sendVerificationEmail();
  }
}
