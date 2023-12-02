import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/register/data/models/register_data.dart';
import 'package:black_market/features/register/data/models/register_model/register_model.dart';
import 'package:black_market/features/register/data/repositories/register_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RigsterRepoImpl implements RegisterBaseRepo {
  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterData registerData) async {
    try {
      Response response = await DioHelper.postData(
        'https://voipsys.space/api/register',
        data: {
          'name': registerData.name,
          'email': registerData.email,
          'password': registerData.password,
          'password_confirmation': registerData.passwordConfirmation,
          'phone': registerData.phone ?? '',
        },
      );
      RegisterModel registerModel = RegisterModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Right(registerModel);
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }
}
