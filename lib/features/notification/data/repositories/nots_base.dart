import 'package:black_market/core/error/failures.dart';
import 'package:black_market/features/notification/data/models/articels_details/articels_details.dart';
import 'package:black_market/features/notification/data/models/articles_model/articles_model.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotifiactionBaseRepo {
  Future<Either<Failure, NotifactionModel>> getNotifaction(int page);
  Future<Either<Failure, ArticlesModel>> getArticles(int page);
  Future<Either<Failure, ArticelsDetails>> getArticlesDetails(
    int page,
  );
}
