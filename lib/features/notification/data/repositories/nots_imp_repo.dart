import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/api/end_points.dart';
import 'package:black_market/core/error/failures.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/notification/data/models/articels_details/articels_details.dart';
import 'package:black_market/features/notification/data/models/articles_model/articles_model.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';
import 'package:black_market/features/notification/data/repositories/nots_base.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotifactionRepoImp implements NotifiactionBaseRepo {
  @override
  Future<Either<Failure, NotifactionModel>> getNotifaction(page) async {
    try {
      Response response = await DioHelper.getData(
          '${Constant.baseUrl}${EndPoints.notifacton}',
          query: {
            "start_date": "2023-11-29",
            "topics":
                'marketing,new_marketing,marketing_1_0_10,gold,currencies,news',
            "page": page,
          });
      NotifactionModel model = NotifactionModel.fromJson(response.data);

      if (response.statusCode == 200) {
        return Right(model);
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return left(RemoteServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, ArticlesModel>> getArticles(int page) async {
    try {
      Response response = await DioHelper.getData(
          '${Constant.baseUrl}${EndPoints.articles}',
          query: {
            "start_date": "2023-11-29",
            "page": page,
          });

      if (response.statusCode == 200) {
        print(response.data.toString());
        ArticlesModel model = ArticlesModel.fromJson(response.data);
        return Right(
          model,
        );
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, ArticelsDetails>> getArticlesDetails(
      int page, ) async {
    try {
      Response response = await DioHelper.getData(
          '${Constant.baseUrl}${EndPoints.articles}',
          query: {
            "start_date": "2023-11-29",
            "page": page,
          });

      if (response.statusCode == 200) {
        print(response.data.toString());
        ArticelsDetails model = ArticelsDetails.fromJson(response.data);
        return Right(
          model,
        );
      } else {
        return Left(RemoteServerFailure('error'));
      }
    } on Exception catch (e) {
      return Left(RemoteServerFailure(
        e.toString(),
      ));
    }
  }
}
