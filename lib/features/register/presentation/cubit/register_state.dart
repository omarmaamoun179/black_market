import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/register/data/models/register_model/register_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterModel registerModel;
  RegisterSuccess(this.registerModel);
}

class RegisterError extends RegisterState {
  final Failure message;
  RegisterError(this.message);
}

class ChangeVisibiltyState extends RegisterState {}
