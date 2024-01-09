import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/api/end_points.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/auth/data/models/forget_pass_model.dart';
import 'package:black_market/features/auth/data/models/update_pass/update_pass.dart';
import 'package:black_market/features/auth/data/models/update_pass_data.dart';
import 'package:black_market/features/auth/data/repositories/base_auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements BaseAuthRepo {
  @override
  Future<Either<Failure, ForgetPassModel>> forgetPassword(String email) async {
    try {
      Response response = await DioHelper.postData(
        
          '${Constant.baseUrl}${EndPoints.forgetPassword}',
          data: {'email': email});

      if (response.statusCode == 200) {
        return Right(ForgetPassModel());
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return Left(
        RemoteServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UpdatePassModel>> updatePassword(
    UpdatePassData updatePassData,
  ) async {
    try {
      Response response = await DioHelper.postData(
        'https://voipsys.space/api/update_forgotten_password',
        //https://voipsys.space/api/update_forgotten_password
        data: {
          'password': updatePassData.password,
          'password_confirmation': updatePassData.passwordConfirmation,
          'otp': updatePassData.otp,
          'email': updatePassData.email,
        },
      );
      print('C');
      UpdatePassModel updatePass = UpdatePassModel.fromJson(response.data);
      print(response.data.toString());

      if (response.statusCode == 200) {
        return Right(updatePass);
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure('error'));
    }
  }
}
