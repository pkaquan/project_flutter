import 'package:projectiot/features/dashboard/domain/entities/security_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseSecurityState {
  final FirestoreRepository repo;
  UseCaseSecurityState(this.repo);

  Stream<SecurityStateEntity> call(String uid) {
    return repo.snapshotSecurityState(uid);
  }
}
