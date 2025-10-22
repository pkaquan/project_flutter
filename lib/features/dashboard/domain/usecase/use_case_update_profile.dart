import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseUpdateProfile {
  final FirestoreRepository repo;
  UseCaseUpdateProfile (this.repo);

  Future <void> call (String uid, String name, String phone) async {
    await repo.updateProfile(uid, name, phone);
  }
}