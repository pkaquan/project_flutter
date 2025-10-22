import 'package:projectiot/features/authentication/domain/repositories/auth_repositories.dart';

class UseCaseLogOut {
  final AuthRepositories _authRepositories;
  UseCaseLogOut(this._authRepositories);
  Future<void> call() async {
    return await _authRepositories.logOut();
  }
}
