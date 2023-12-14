import 'package:black_market/features/notification/data/models/articels_details/articels_details.dart';
import 'package:black_market/features/notification/data/models/articles_model/articles_model.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  NotifactionModel notifactionModel;

  NotificationSuccess(
    this.notifactionModel,
  );
}

class NotificationError extends NotificationState {
  final String error;
  NotificationError(this.error);
}

class NotificationChangeTab extends NotificationState {
  NotificationChangeTab();
}

class ArticlesLoadingState extends NotificationState {}

class ArticlesSuccessState extends NotificationState {
  final ArticlesModel articlesModel;
  ArticlesSuccessState(this.articlesModel);
}

class ArticlesErrorState extends NotificationState {
  final String error;
  ArticlesErrorState(this.error);
}

class GetArticlesDetailsLoadingState extends NotificationState {}

class ArticesDetailsSuccessState extends NotificationState {
  ArticelsDetails articelsDetails;
  ArticesDetailsSuccessState(this.articelsDetails);
}

class ArticesDetailsErrorState extends NotificationState {
  final String error;
  ArticesDetailsErrorState(this.error);
}
