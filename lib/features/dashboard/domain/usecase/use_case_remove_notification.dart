import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseRemoveNotification {
  final FirestoreRepository repo;
  UseCaseRemoveNotification(this.repo);

  Future<void> call(String uid) async {
    await repo.removeNotification(uid);
  }
}
