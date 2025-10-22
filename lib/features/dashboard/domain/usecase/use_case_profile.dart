import 'package:projectiot/features/dashboard/domain/entities/profile_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseProfile {
  final FirestoreRepository firestoreRepository;
  UseCaseProfile(this.firestoreRepository);

  Stream<ProfileEntity> call(String uid) {
    return firestoreRepository.snapshotProfile(uid);
  }
}
