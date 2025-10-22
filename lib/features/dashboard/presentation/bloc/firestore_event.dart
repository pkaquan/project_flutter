import 'package:equatable/equatable.dart';

abstract class FirestoreEvent extends Equatable {
  const FirestoreEvent();
  @override
  List<Object?> get props => [];
}

class StartDashboardEvent extends FirestoreEvent {}

class InitDataEvent extends FirestoreEvent {
  final String uid;
  final String email;
  const InitDataEvent(this.uid, this.email);
  @override
  List<Object?> get props => [uid, email];
}

class UpdateTokenNotificationEvent extends FirestoreEvent {
  final String uid;
  const UpdateTokenNotificationEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class NotificationStateEvent extends FirestoreEvent {
  final String uid;
  const NotificationStateEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class RemoveNotificationEvent extends FirestoreEvent {
  final String uid;
  const RemoveNotificationEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class SaveProfileEvent extends FirestoreEvent {
  final String uid;
  final String name;
  final String phone;
  const SaveProfileEvent(this.uid, this.name, this.phone);
  @override
  List<Object?> get props => [uid, name, phone];
}

class UpdateStateHouseEvent extends FirestoreEvent {
  final String uid;
  const UpdateStateHouseEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class StateProfileEvent extends FirestoreEvent {
  final String uid;
  const StateProfileEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class ControlMotorEvent extends FirestoreEvent {
  final String uid;
  final bool button;
  final int slide;
  final int hour;
  final int minute;
  final int timer;
  const ControlMotorEvent(
    this.uid,
    this.button,
    this.slide,
    this.hour,
    this.minute,
    this.timer,
  );
  @override
  List<Object?> get props => [button, slide, hour, minute, timer];
}

class StateWateringPlantEvent extends FirestoreEvent {
  final String uid;
  const StateWateringPlantEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class ControlDeviceHouseEvent extends FirestoreEvent {
  final String uid;
  final bool stateButtonDevice;
  final int listButtonDevice;
  const ControlDeviceHouseEvent(
    this.uid,
    this.stateButtonDevice,
    this.listButtonDevice,
  );
  @override
  List<Object?> get props => [uid, stateButtonDevice, listButtonDevice];
}

class StateDeviceHouseEvent extends FirestoreEvent {
  final String uid;
  const StateDeviceHouseEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}

class SaveNameDeviceHouseEvent extends FirestoreEvent {
  final String uid;
  final String textNameDevice;
  final int listNameDevice;
  const SaveNameDeviceHouseEvent(
    this.uid,
    this.textNameDevice,
    this.listNameDevice,
  );
  @override
  List<Object?> get props => [uid, textNameDevice, listNameDevice];
}

class SecurityEvent extends FirestoreEvent {
  final String uid;
  const SecurityEvent(this.uid);
  @override
  List<Object?> get props => [uid];
}
