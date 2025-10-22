import 'package:projectiot/features/authentication/domain/entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

class UseCaseAuthChangeState {
  final AuthRepositories _authRepositories;
  UseCaseAuthChangeState (this._authRepositories);
  Stream <UserEntity?> call () {
    return _authRepositories.authChangeState();
  }
}