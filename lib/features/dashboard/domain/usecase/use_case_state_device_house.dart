import 'package:projectiot/features/dashboard/domain/entities/control_device_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseStateDeviceHouse {
  final FirestoreRepository repo;
  UseCaseStateDeviceHouse (this.repo);
  Stream <List<ControlDeviceEntity>> call (String uid)  {
    return repo.snapshotDeviceHouse(uid);
  }
}