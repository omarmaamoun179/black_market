part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoginLoading extends AuthState {}
class AuthLoginSuccess extends AuthState {}
class AuthLoginError extends AuthState {
  final String message;
  AuthLoginError(this.message);
}
class AuthRegisterLoading extends AuthState {}
class AuthRegisterSuccess extends AuthState {}
class AuthRegisterError extends AuthState {
  final String message;
  AuthRegisterError(this.message);
}

class ChangeVisibilityState extends AuthState {}