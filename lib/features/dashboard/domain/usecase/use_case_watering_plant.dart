import 'package:projectiot/features/dashboard/domain/entities/watering_plant_entity.dart';

import '../repositories/firestore_repository.dart';

class UseCaseWateringPlant {
  final FirestoreRepository firestoreRepository;
  UseCaseWateringPlant(this.firestoreRepository);

  Stream<WateringPlantEntity> call(String uid) {
    return firestoreRepository.snapshotWateringPlant(uid);
  }
}
