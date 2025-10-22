import 'package:equatable/equatable.dart';
import 'package:projectiot/features/dashboard/domain/entities/control_device_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/notification_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/profile_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/security_state_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/state_house_entity.dart';
import 'package:projectiot/features/dashboard/domain/entities/watering_plant_entity.dart';

abstract class FirestoreState extends Equatable {
  const FirestoreState();
  @override
  List<Object?> get props => [];
}

class StartDashboardState extends FirestoreState {}

class InitDataState extends FirestoreState {}

class DataSuccess extends FirestoreState {}

class FirestoreLoadingDataState extends FirestoreState {}

class MessageDataState extends FirestoreState {}

class NotificationState extends FirestoreState {
  final List<NotificationStateEntity> entity;
  const NotificationState(this.entity);
  @override
  List<Object?> get props => [entity];
}

class ProfileState extends FirestoreState {
  final ProfileEntity profile;
  const ProfileState(this.profile);
  @override
  List<Object?> get props => [profile];
}

class StateHouseState extends FirestoreState {
  final StateHouseEntity stateHouse;
  const StateHouseState(this.stateHouse);
  @override
  List<Object?> get props => [stateHouse];
}

class ControlDeviceHouseState extends FirestoreState {
  final List<ControlDeviceEntity> device;
  const ControlDeviceHouseState(this.device);
  @override
  List<Object?> get props => [device];
}

class StatePlantState extends FirestoreState {
  final WateringPlantEntity wateringPlant;
  const StatePlantState(this.wateringPlant);
  @override
  List<Object?> get props => [wateringPlant];
}

class SecurityState extends FirestoreState {
  final SecurityStateEntity state;
  const SecurityState(this.state);
  @override
  List<Object?> get props => [state];
}
