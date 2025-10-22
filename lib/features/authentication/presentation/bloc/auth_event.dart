import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class InitAppEvent extends AuthEvent {}

class AppStartEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  const RegisterEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

class SendVerificationEmail extends AuthEvent {}

class ResetPassword extends AuthEvent {
  final String email;
  const ResetPassword(this.email);
  @override
  List<Object?> get props => [email];
}

class LogOutEvent extends AuthEvent {}
