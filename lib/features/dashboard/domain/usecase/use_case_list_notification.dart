import 'package:projectiot/features/dashboard/domain/entities/notification_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseListNotification {
  final FirestoreRepository repo;
  UseCaseListNotification (this.repo);

  Stream <List<NotificationStateEntity>> call (String uid) {
    return repo.snapshotNotification(uid);
  }
}