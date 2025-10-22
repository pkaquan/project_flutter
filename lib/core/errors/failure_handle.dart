import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginFirebaseException extends Failure {
  const LoginFirebaseException(super.code);
}

class RegisterFirebaseException extends Failure {
  const RegisterFirebaseException(super.code);
}

class NetworkException extends Failure {
  const NetworkException(super.code);
}

class UnknowException extends Failure {
  const UnknowException(super.code);
}

class VerificationEmailError extends Failure {
  const VerificationEmailError(super.code);
}
