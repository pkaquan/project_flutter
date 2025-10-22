import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectiot/features/dashboard/data/models/control_device_model.dart';
import 'package:projectiot/features/dashboard/data/models/control_motor.dart';
import 'package:projectiot/features/dashboard/data/models/notification_state_model.dart';
import 'package:projectiot/features/dashboard/data/models/profile_model.dart';
import 'package:projectiot/features/dashboard/data/models/security_state_model.dart';
import 'package:projectiot/features/dashboard/data/models/state_house_model.dart';
import 'package:projectiot/features/dashboard/data/models/watering_plant_model.dart';

abstract class FirestoreDataSource {
  CollectionReference<Map<String, dynamic>> get collection;
  Future<void> initFirestore(String uid, String email);
  Future<void> updateTokenNotification(String uid, String token);
  Future<void> removeNotification(String uid);
  Future<void> updateDataProfile(String uid, String name, String phone);
  Future<void> updateDataButtonDevice(String uid, bool buttonDevice, int list);
  Future<void> updateDataNameDevice(String uid, String name, int list);
  Future<void> updateDataWateringPlant(
    String uid,
    bool button,
    int slide,
    int hour,
    int minute,
    int timer,
  );
  Stream<List<NotificationStateModel>> snapshotNotification(String uid);
  Stream<ProfileModel> snapshotProfileData(String uid);
  Stream<List<ControlDeviceModel>> snapshotDeviceData(String uid);
  Stream<WateringPlantModel> snapshotWateringPlantData(String uid);
  Stream<StateHouseModel> snapshotStateHouseData(String uid);
  Stream<SecurityStateModel> snapshotStateSecurity(String uid);
}

class FirestoreRemoteDataSourceImpl implements FirestoreDataSource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      _firebaseFirestore.collection('users');

  @override
  Future<void> initFirestore(String uid, String email) async {
    Map<String, dynamic> devicesData = {};
    for (int i = 1; i <= 8; i++) {
      devicesData['Device $i'] = ControlDeviceModel(
        name: '',
        state: false,
      ).toMap();
    }
    await collection.doc(uid).set({
      'Email': email,
      'Token Notification': '',
      'Notification': {},
      'Profile': ProfileModel(name: '', phone: '').toMap(),
      'Device': devicesData,
      'Alert House': {'alert': false},
      'State House': StateHouseModel(
        humidity: 0,
        temperature: 0,
        alertFire: 0,
      ).toMap(),
      'Watering Plant': WateringPlantModel(
        humidityPlant: 0,
        statePump: false,
        button: false,
        speedMotor: 85,
        hourSetTime: 0,
        minuteSetTime: 0,
        timer: 1,
      ).toMap(),
    });
  }

  @override
  Future<void> updateTokenNotification(String uid, String token) async {
    await collection.doc(uid).update({'Token Notification': token});
  }

  @override
  Future<void> removeNotification(String uid) async {
    await collection.doc(uid).update({'Notification': {}});
  }

  @override
  Future<void> updateDataProfile(String uid, String name, String phone) async {
    await collection.doc(uid).update({
      'Profile': ProfileModel(name: name, phone: phone).toMap(),
    });
  }

  @override
  Future<void> updateDataButtonDevice(
    String uid,
    bool buttonDevice,
    int list,
  ) async {
    await collection.doc(uid).update({
      'Device.Device $list.State': buttonDevice,
    });
  }

  @override
  Future<void> updateDataNameDevice(String uid, String name, int list) async {
    await collection.doc(uid).update({'Device.Device $list.Name Device': name});
  }

  @override
  Future<void> updateDataWateringPlant(
    String uid,
    bool button,
    int value,
    int hour,
    int minute,
    int timer,
  ) async {
    await collection.doc(uid).update({
      'Watering Plant': ControlMotor(
        button: button,
        speed: value,
        hour: hour,
        minute: minute,
        timer: timer,
      ).toMap(),
    });
  }

  @override
  Stream<List<NotificationStateModel>> snapshotNotification(String uid) {
    return collection.doc(uid).snapshots().map((map) {
      final data = map.data();
      if (data == null) return [];
      Map<String, dynamic> mapData = data['Notification'];
      Map<String, dynamic> quantityData = Map<String, dynamic>.from(
        data['Notification'],
      );
      int lengthData = quantityData.length;
      List<NotificationStateModel> listNotification = [];
      for (int i = 1; i <= lengthData; i++) {
        final key = 'Notification $i';
        Map<String, dynamic>? notificationData = mapData[key];
        if (notificationData != null) {
          listNotification.add(
            NotificationStateModel.fromMap(notificationData),
          );
        }
      }
      return listNotification;
    });
  }

  @override
  Stream<ProfileModel> snapshotProfileData(String uid) {
    return collection
        .doc(uid)
        .snapshots()
        .map((snapshot) => ProfileModel.fromJson(snapshot['Profile']));
  }

  @override
  Stream<List<ControlDeviceModel>> snapshotDeviceData(String uid) {
    return collection.doc(uid).snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data == null) return [];

      Map<String, dynamic>? deviceMap = data['Device'];
      if (deviceMap == null) return [];

      List<ControlDeviceModel> devices = [];

      for (int i = 1; i <= 8; i++) {
        final key = 'Device $i';
        Map<String, dynamic>? deviceData = deviceMap[key];

        if (deviceData != null) {
          devices.add(ControlDeviceModel.fromMap(deviceData));
        }
      }

      return devices;
    });
  }

  @override
  Stream<WateringPlantModel> snapshotWateringPlantData(String uid) {
    return collection
        .doc(uid)
        .snapshots()
        .map(
          (snapshot) =>
              WateringPlantModel.fromToJson(snapshot['Watering Plant']),
        );
  }

  @override
  Stream<StateHouseModel> snapshotStateHouseData(String uid) {
    return collection
        .doc(uid)
        .snapshots()
        .map((snapshot) => StateHouseModel.fromToMap(snapshot['State House']));
  }

  @override
  Stream<SecurityStateModel> snapshotStateSecurity(String uid) {
    return collection
        .doc(uid)
        .snapshots()
        .map(
          (snapshot) => SecurityStateModel.fromeMap(snapshot['Alert House']),
        );
  }
}
