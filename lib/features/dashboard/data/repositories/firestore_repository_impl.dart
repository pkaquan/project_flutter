import 'package:projectiot/features/dashboard/data/datasource/firestore_remote_data.dart';
import 'package:projectiot/features/dashboard/domain/entities/control_device_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/notification_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/security_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/state_house_entity.dart';
import '../../domain/entities/watering_plant_entity.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirestoreDataSource _firestoreDataSource;
  FirestoreRepositoryImpl(this._firestoreDataSource);

  @override
  Future<void> initData(String uid, String email) async {
    await _firestoreDataSource.initFirestore(uid, email);
  }

  @override
  Future<void> updateTokenNotification(String uid, String token) async {
    await _firestoreDataSource.updateTokenNotification(uid, token);
  }

  @override
  Future<void> removeNotification(String uid) async {
    await _firestoreDataSource.removeNotification(uid);
  }

  @override
  Future<void> updateProfile(String uid, String name, String phone) async {
    await _firestoreDataSource.updateDataProfile(uid, name, phone);
  }

  @override
  Future<void> updateButtonDevice(String uid, bool button, int list) async {
    await _firestoreDataSource.updateDataButtonDevice(uid, button, list);
  }

  @override
  Future<void> updateSaveNameDevice(String uid, String name, int list) async {
    await _firestoreDataSource.updateDataNameDevice(uid, name, list);
  }

  @override
  Future<void> updateWateringPlant(
    String uid,
    bool button,
    int slide,
    int hour,
    int minute,
    int timer,
  ) async {
    await _firestoreDataSource.updateDataWateringPlant(
      uid,
      button,
      slide,
      hour,
      minute,
      timer,
    );
  }

  @override
  Stream<List<NotificationStateEntity>> snapshotNotification(String uid) {
    return _firestoreDataSource.snapshotNotification(uid).map((snapshot) {
      return snapshot.map((e) => e.toMapEntity()).toList();
    });
  }

  @override
  Stream<ProfileEntity> snapshotProfile(String uid) {
    return _firestoreDataSource
        .snapshotProfileData(uid)
        .map((snapshot) => snapshot.toEntity());
  }

  @override
  Stream<List<ControlDeviceEntity>> snapshotDeviceHouse(String uid) {
    return _firestoreDataSource.snapshotDeviceData(uid).map((snapshot) {
      return snapshot.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Stream<WateringPlantEntity> snapshotWateringPlant(String uid) {
    return _firestoreDataSource
        .snapshotWateringPlantData(uid)
        .map((snapshot) => snapshot.toEntity());
  }

  @override
  Stream<StateHouseEntity> snapshotStateHouse(String uid) {
    return _firestoreDataSource
        .snapshotStateHouseData(uid)
        .map((snapshot) => snapshot.toEntity());
  }

  @override
  Stream<SecurityStateEntity> snapshotSecurityState(String uid) {
    return _firestoreDataSource
        .snapshotStateSecurity(uid)
        .map((map) => map.toEntity());
  }
}
