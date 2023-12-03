import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeBaseRepo {
  Future<Either<Failure, List<CoinsModel>>> getHomeData();
  Future<Either<Failure, List<BanksModel>>> getBanksData();
}
