import 'package:equatable/equatable.dart';
import 'package:projectiot/core/errors/failure_handle.dart';
import 'package:projectiot/features/authentication/domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthChangeState extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserEntity user;
  const AuthenticatedState(this.user);
  @override
  List<Object?> get props => [user];
}

class UnAuthenticated extends AuthState {}

class LoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserEntity userEntity;
  const LoginSuccessState(this.userEntity);
  @override
  List<Object?> get props => [userEntity];
}

class RegisterSuccessState extends AuthState {
  final UserEntity userEntity;
  const RegisterSuccessState(this.userEntity);
  @override
  List<Object?> get props => [userEntity];
}

class MessageErrorState extends AuthState {
  final Failure message;
  const MessageErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class SendVerificationEmailState extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class LogOutState extends AuthState {}
