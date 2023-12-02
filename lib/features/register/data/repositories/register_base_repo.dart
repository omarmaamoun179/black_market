import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/register/data/models/register_data.dart';
import 'package:black_market/features/register/data/models/register_model/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterBaseRepo {
  Future<Either<Failure, RegisterModel>> register(
    RegisterData registerData,
  );
}
