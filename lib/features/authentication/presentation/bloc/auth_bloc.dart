import 'package:bloc/bloc.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_log_out.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_login.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_register.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_reset_password.dart';
import 'package:projectiot/features/authentication/domain/usecases/usecase_send_verification_email.dart';

import '../../domain/usecases/usecase_auth_change_state.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UseCaseAuthChangeState useCaseAuthChangeState;
  final UseCaseLogin useCaseLogin;
  final UseCaseRegister useCaseRegister;
  final UseCaseResetPassword useCaseResetPassword;
  final UseCaseSendVerificationEmail useCaseSendVerificationEmail;
  final UseCaseLogOut useCaseLogOut;
  AuthBloc({
    required this.useCaseAuthChangeState,
    required this.useCaseLogin,
    required this.useCaseRegister,
    required this.useCaseSendVerificationEmail,
    required this.useCaseResetPassword,
    required this.useCaseLogOut,
  }) : super(AuthInitial()) {
    on<InitAppEvent>((event, emit) async {
      emit(AuthInitial());
      await Future.delayed(Duration(seconds: 5));
      emit(AuthChangeState());
    });

    on<AppStartEvent>((event, emit) async {
      emit(LoadingState());
      await emit.forEach(
        useCaseAuthChangeState(),
        onData: ((user) =>
            user != null ? AuthenticatedState(user) : UnAuthenticated()),
      );
    });

    on<LoginEvent>((event, emit) async {
      final result = await useCaseLogin(event.email, event.password);
      result.fold(
        (error) => emit(MessageErrorState(error)),
        (user) => emit(LoginSuccessState(user)),
      );
    });

    on<RegisterEvent>((event, emit) async {
      final result = await useCaseRegister(event.email, event.password);
      result.fold(
        (error) => emit(MessageErrorState(error)),
        (user) => emit(RegisterSuccessState(user)),
      );
    });

    on<SendVerificationEmail>((event, emit) async {
      await useCaseSendVerificationEmail();
      emit(SendVerificationEmailState());
    });

    on<ResetPassword>((event, emit) async {
      emit(LoadingState());
      await useCaseResetPassword(event.email);
      emit(ResetPasswordSuccess());
    });

    on<LogOutEvent>((event, emit) async {
      await useCaseLogOut();
      emit(LogOutState());
    });
  }
}
