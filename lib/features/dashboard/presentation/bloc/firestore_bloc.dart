import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectiot/features/dashboard/domain/usecase/init_app.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_control_device.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_list_notification.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_profile.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_remove_notification.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_save_name_device.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_security_state.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_state_device_house.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_state_house.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_update_profile.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_update_state_watering_plant.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_update_token_notification.dart';
import 'package:projectiot/features/dashboard/domain/usecase/use_case_watering_plant.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_event.dart';
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  final InitApp initApp;
  final UseCaseUpdateTokenNotification useCaseUpdateTokenNotification;
  final UseCaseListNotification useCaseListNotification;
  final UseCaseRemoveNotification useCaseRemoveNotification;
  final UseCaseUpdateProfile useCaseUpdateProfile;
  final UseCaseProfile useCaseProfile;
  final UseCaseUpdateStateWateringPlant useCaseUpdateStateWateringPlant;
  final UseCaseWateringPlant useCaseWateringPlant;
  final UseCaseStateHouse useCaseStateHouse;
  final UseCaseSaveNameDevice useCaseSaveNameDevice;
  final UseCaseControlDevice useCaseControlDevice;
  final UseCaseStateDeviceHouse useCaseStateDeviceHouse;
  final UseCaseSecurityState useCaseSecurityState;

  FirestoreBloc({
    required this.initApp,
    required this.useCaseUpdateTokenNotification,
    required this.useCaseListNotification,
    required this.useCaseRemoveNotification,
    required this.useCaseUpdateProfile,
    required this.useCaseProfile,
    required this.useCaseUpdateStateWateringPlant,
    required this.useCaseWateringPlant,
    required this.useCaseStateHouse,
    required this.useCaseSaveNameDevice,
    required this.useCaseControlDevice,
    required this.useCaseStateDeviceHouse,
    required this.useCaseSecurityState,
  }) : super(InitDataState()) {
    FirestoreLoadingDataState();

    on<StartDashboardEvent>((event, emit) {
      emit(InitDataState());
    });

    on<InitDataEvent>((event, emit) async {
      await initApp(event.uid, event.email);
    });

    on<UpdateStateHouseEvent>((event, emit) async {
      await emit.forEach(
        useCaseStateHouse(event.uid),
        onData: (data) => StateHouseState(data),
      );
    });

    on<UpdateTokenNotificationEvent>((event, emit) async {
      await useCaseUpdateTokenNotification(event.uid);
    });

    on<RemoveNotificationEvent>((event, emit) async {
      await useCaseRemoveNotification(event.uid);
    });

    on<SaveProfileEvent>((event, emit) async {
      await useCaseUpdateProfile(event.uid, event.name, event.phone);
      emit(MessageDataState());
    });

    on<StateProfileEvent>((event, emit) async {
      await emit.forEach(
        useCaseProfile(event.uid),
        onData: (data) => ProfileState(data),
      );
    });

    on<ControlMotorEvent>((event, emit) async {
      await useCaseUpdateStateWateringPlant(
        event.uid,
        event.button,
        event.slide,
        event.hour,
        event.minute,
        event.timer,
      );
      emit(MessageDataState());
    });

    on<NotificationStateEvent>((event, emit) async {
      await emit.forEach(
        useCaseListNotification(event.uid),
        onData: (data) => NotificationState(data),
      );
    });

    on<StateWateringPlantEvent>((event, emit) async {
      await emit.forEach(
        useCaseWateringPlant(event.uid),
        onData: (data) => StatePlantState(data),
      );
    });

    on<ControlDeviceHouseEvent>((event, emit) async {
      await useCaseControlDevice(
        event.uid,
        event.stateButtonDevice,
        event.listButtonDevice,
      );
    });

    on<SaveNameDeviceHouseEvent>((event, emit) async {
      await useCaseSaveNameDevice(
        event.uid,
        event.textNameDevice,
        event.listNameDevice,
      );
    });
    on<StateDeviceHouseEvent>((event, emit) async {
      await emit.forEach(
        useCaseStateDeviceHouse(event.uid),
        onData: (data) => ControlDeviceHouseState(data),
      );
    });
    on<SecurityEvent>((event, emit) async {
      await emit.forEach(
        useCaseSecurityState(event.uid),
        onData: (data) => SecurityState(data),
      );
    });
  }
}
