import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseControlDevice {
  final FirestoreRepository repo;
  UseCaseControlDevice (this.repo);
  Future <void> call (String uid, bool state, int list) async {
    await repo.updateButtonDevice(uid, state, list);
  }
}