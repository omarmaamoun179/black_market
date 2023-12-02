part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  ForgetPassModel forgetPassModel;
  AuthSuccess(this.forgetPassModel);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
