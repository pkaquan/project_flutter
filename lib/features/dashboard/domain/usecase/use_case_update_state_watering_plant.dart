import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseUpdateStateWateringPlant {
  final FirestoreRepository repo;
  UseCaseUpdateStateWateringPlant(this.repo);
  Future<void> call(
    String uid,
    bool button,
    int slide,
    int hour,
    int minute,
    int timer,
  ) async {
    await repo.updateWateringPlant(uid, button, slide, hour, minute, timer);
  }
}
