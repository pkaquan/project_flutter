import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';

class UseCaseSaveNameDevice {
  final FirestoreRepository repo;
  UseCaseSaveNameDevice (this.repo);
  Future <void> call (String uid, String nameDevice, int listDevice) async {
    await repo.updateSaveNameDevice(uid, nameDevice, listDevice);
  }
}