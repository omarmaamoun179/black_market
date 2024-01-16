import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/api/end_points.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/login/data/models/login_data.dart';
import 'package:black_market/features/login/data/models/login_model/login_model.dart';
import 'package:black_market/features/login/data/repositories/base_login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginBaseRepo {
  @override
  Future<Either<Failure, LoginModel>> login(LoginData loginData) async {
    try {
      Response response = await DioHelper.postData(
        '${Constant.baseUrl}${EndPoints.login}',
        data: {
          'email': loginData.email,
          'password': loginData.password,
        },
      );
      LoginModel loginModel = LoginModel.fromJson(response.data);
      print(response.data.toString());
      if (response.statusCode == 200) {
        return Right(loginModel);
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
          RemoteServerFailure.fromDioError(e),
        );
      }

      return Left(RemoteServerFailure(e.toString()));
    }
  }
}
