import 'package:get_it/get_it.dart';
import 'package:projectiot/features/authentication/data/datasource/AuthRemoteDataSource.dart';
import 'package:projectiot/features/authentication/data/repositories/auth_repositories_impl.dart';
import 'package:projectiot/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_auth_change_state.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_log_out.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_login.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_register.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_reset_password.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_send_verification_email.dart';
import 'package:projectiot/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:projectiot/features/dashboard/data/datasource/firestore_remote_data.dart';
import 'package:projectiot/features/dashboard/data/repositories/firestore_repository_impl.dart';
import 'package:projectiot/features/dashboard/domain/repositories/firestore_repository.dart';
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
import 'package:projectiot/features/dashboard/presentation/bloc/firestore_bloc.dart';

final sl = GetIt.instance;

Future<void> authInjection() async {
  sl.registerFactory(
    () => AuthBloc(
      useCaseAuthChangeState: sl(),
      useCaseLogin: sl(),
      useCaseRegister: sl(),
      useCaseSendVerificationEmail: sl(),
      useCaseResetPassword: sl(),
      useCaseLogOut: sl(),
    ),
  );

  sl.registerLazySingleton(() => UseCaseAuthChangeState(sl()));
  sl.registerLazySingleton(() => UseCaseLogin(sl()));
  sl.registerLazySingleton(() => UseCaseRegister(sl()));
  sl.registerLazySingleton(() => UseCaseSendVerificationEmail(sl()));
  sl.registerLazySingleton(() => UseCaseResetPassword(sl()));
  sl.registerLazySingleton(() => UseCaseLogOut(sl()));

  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(sl()));

  sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
}

Future<void> dashboardInjection() async {
  sl.registerFactory(
    () => FirestoreBloc(
      initApp: sl(),
      useCaseUpdateTokenNotification: sl(),
      useCaseListNotification: sl(),
      useCaseRemoveNotification: sl(),
      useCaseProfile: sl(),
      useCaseUpdateProfile: sl(),
      useCaseUpdateStateWateringPlant: sl(),
      useCaseWateringPlant: sl(),
      useCaseStateHouse: sl(),
      useCaseSaveNameDevice: sl(),
      useCaseControlDevice: sl(),
      useCaseStateDeviceHouse: sl(),
      useCaseSecurityState: sl(),
    ),
  );

  sl.registerLazySingleton(() => InitApp(sl()));
  sl.registerLazySingleton(() => UseCaseUpdateTokenNotification(sl()));
  sl.registerLazySingleton(() => UseCaseListNotification(sl()));
  sl.registerLazySingleton(() => UseCaseRemoveNotification(sl()));
  sl.registerLazySingleton(() => UseCaseProfile(sl()));
  sl.registerLazySingleton(() => UseCaseUpdateProfile(sl()));
  sl.registerLazySingleton(() => UseCaseUpdateStateWateringPlant(sl()));
  sl.registerLazySingleton(() => UseCaseWateringPlant(sl()));
  sl.registerLazySingleton(() => UseCaseStateHouse(sl()));
  sl.registerLazySingleton(() => UseCaseSaveNameDevice(sl()));
  sl.registerLazySingleton(() => UseCaseControlDevice(sl()));
  sl.registerLazySingleton(() => UseCaseStateDeviceHouse(sl()));
  sl.registerLazySingleton(() => UseCaseSecurityState(sl()));

  sl.registerLazySingleton<FirestoreRepository>(
    () => FirestoreRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<FirestoreDataSource>(
    () => FirestoreRemoteDataSourceImpl(),
  );
}
