import 'package:black_market/features/login/data/models/login_model/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  LoginModel loginModel;
  LoginSuccess(this.loginModel);
}
class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
class ChangeVisibilityState extends LoginState {}