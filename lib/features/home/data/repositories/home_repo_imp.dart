import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/api/end_points.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/repositories/home_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeBaseRepo {
  @override
  Future<Either<Failure, List<CoinsModel>>> getHomeData() async {
    try {
      Response response =
          await DioHelper.getData('${Constant.currencies}${EndPoints.latest}');
      List<dynamic> data = response.data;

      List<CoinsModel> model = data.map((e) => CoinsModel.fromJson(e)).toList();

      if (response.statusCode == 200) {
        return Right(model);
      } else {
        return Left(RemoteServerFailure(
            'Error Code: ${response.statusCode} \n Error Message: ${response.statusMessage}'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BanksModel>>> getBanksData() async {
    try {
      var response = await DioHelper.getData('https://voipsys.space/api/banks');
      List<dynamic> data = response.data;

      List<BanksModel> model = data.map((e) => BanksModel.fromJson(e)).toList();
      if (response.statusCode == 200) {
        return Right(
          model,
        );
      } else {
        return Left(RemoteServerFailure(
            'Error Code: ${response.statusCode} \n Error Message: ${response.statusMessage}'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, CoinsModel>> getCoinsId(int id) async {
  //   try {
  //     var response = await DioHelper.getData(
  //       'https://voipsys.space/api/currencies/historical',
  //       query: {
  //         'currency_id': id,
  //         'type': 'live',
  //         'start_date': '2023-12-8',
  //       },
  //     );
  //     CoinsModel model = CoinsModel.fromJson(response.data,);
  //     if (response.statusCode == 200) {
  //       return Right(
  //         model,
  //       );
  //     } else {
  //       return Left(RemoteServerFailure(
  //           'Error Code: ${response.statusCode} \n Error Message: ${response.statusMessage}'));
  //     }
  //   } catch (e) {
  //     return Left(RemoteServerFailure(e.toString()));
  //   }
  // }
}
