import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/auth/data/models/email.dart';
import 'package:black_market/features/auth/data/models/forget_pass_model.dart';
import 'package:black_market/features/auth/data/repositories/base_auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements BaseAuthRepo {
  @override
  Future<Either<Failure, ForgetPassModel>> forgetPassword(
      EmailData email) async {
    try {
      Response response = await DioHelper.postData(
          'https://voipsys.space/api/forget_password',
          data: {
            'email': email.email,
          });

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
}
