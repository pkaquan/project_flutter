import 'package:projectiot/features/dashboard/domain/entities/control_device_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/notification_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/profile_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/security_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/state_house_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/watering_plant_entity.dart';

abstract class FirestoreRepository {
  Future<void> initData(String uid, String email);
  Future<void> updateTokenNotification(String uid, String token);
  Future<void> removeNotification(String uid);
  Future<void> updateProfile(String uid, String name, String phone);
  Future<void> updateButtonDevice(String uid, bool state, int list);
  Future<void> updateSaveNameDevice(String uid, String name, int list);
  Future<void> updateWateringPlant(
    String uid,
    bool button,
    int slide,
    int hour,
    int minute,
    int timer,
  );
  Stream<List<NotificationStateEntity>> snapshotNotification(String uid);
  Stream<ProfileEntity> snapshotProfile(String uid);
  Stream<List<ControlDeviceEntity>> snapshotDeviceHouse(String uid);
  Stream<WateringPlantEntity> snapshotWateringPlant(String uid);
  Stream<StateHouseEntity> snapshotStateHouse(String uid);
  Stream<SecurityStateEntity> snapshotSecurityState(String uid);
}
