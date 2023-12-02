import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/login/data/models/login_data.dart';
import 'package:black_market/features/login/data/models/login_model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginBaseRepo {
  Future<Either<Failure, LoginModel>> login(
    LoginData loginData,
  );
}
