import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/api/end_points.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/compnies_model/compnies_model.dart';
import 'package:black_market/features/home/data/models/golds_model/golds_model.dart';
import 'package:black_market/features/home/data/models/ingots_model/ingots_model.dart';
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
      var response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.banks}');
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

  @override
  Future<Either<Failure, List<GoldsModel>>> getGoldsData() async {
    try {
      var response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.gold}');
      List<dynamic> data = response.data;

      List<GoldsModel> model = data.map((e) => GoldsModel.fromJson(e)).toList();
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

  @override
  Future<Either<Failure, List<CompniesModel>>> getCompaniesData() async {
    try {
      var response =
          await DioHelper.getData('${Constant.baseUrl}${EndPoints.companies}');
      List<dynamic> data = response.data;

      List<CompniesModel> model =
          data.map((e) => CompniesModel.fromJson(e)).toList();
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
@override
Future<Either<Failure, IngotsModel>> getIngotsData() async {
  try {
    var response = await DioHelper.getData(
      '${Constant.baseUrl}${EndPoints.goldIngot}',
    );

    IngotsModel model = IngotsModel.fromJson(response.data);
    print(response.data);
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

}
