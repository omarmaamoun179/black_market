import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/chart_model/chart_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/compnies_model/compnies_model.dart';
import 'package:black_market/features/home/data/models/golds_model/golds_model.dart';
import 'package:black_market/features/home/data/models/ingots_model/ingots_model.dart';
import 'package:black_market/features/home/data/models/profiel_model/profiel_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeBaseRepo {
  Future<Either<Failure, List<CoinsModel>>> getHomeData();
  Future<Either<Failure, List<BanksModel>>> getBanksData();
  Future<Either<Failure, List<GoldsModel>>> getGoldsData();
  Future<Either<Failure, List<CompniesModel>>> getCompaniesData();
  Future<Either<Failure, IngotsModel>> getIngotsData();
  Future<Either<Failure, ChartModel>> getChartData(
      int id, String type, DateTime date);
  Future<Either<Failure, ProfileModel>> getProfileData();
}
