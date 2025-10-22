import 'package:projectiot/core/service/cloud_messaging.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseUpdateTokenNotification {
  final FirestoreRepository repo;
  UseCaseUpdateTokenNotification(this.repo);

  Future<void> call(String uid) async {
    final token = await CloudMessaging.tokenFM();
    if (token != null) {
      await repo.updateTokenNotification(uid, token!);
    } else {
      await repo.updateTokenNotification(uid, '');
    }
  }
}
