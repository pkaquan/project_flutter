import 'package:projectiot/features/dashboard/domain/entities/state_house_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseStateHouse {
  final FirestoreRepository firestoreRepository;
  UseCaseStateHouse(this.firestoreRepository);

  Stream<StateHouseEntity> call(String uid) {
    return firestoreRepository.snapshotStateHouse(uid);
  }
}
