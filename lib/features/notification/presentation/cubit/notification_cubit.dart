import 'package:black_market/features/notification/data/models/articels_details/comment.dart';
import 'package:black_market/features/notification/data/models/articels_details/datum.dart';
import 'package:black_market/features/notification/data/models/articles_model/datum.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/datum.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';
import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
    this.notifactionRepoImp,
  ) : super(NotificationInitial());
  NotifactionRepoImp notifactionRepoImp;
  static NotificationCubit get(context) => BlocProvider.of(context);
  List<String> tabs = ['الإشعارات', 'المقالات'];
  int currentIndex = 0;
  List<DatumNots> nots = [];
  List<DatumArticles> articels = [];
  List<DatumArticlesDetails> articelsDetails = [];
  NotifactionModel? notifactionModel;


  ScrollController scrollController = ScrollController();

  int page = 1;
  changeTab(int index) {
    currentIndex = index;

    emit(NotificationChangeTab());
  }

  getNotifaction() async {
    emit(NotificationLoading());
    final response = await notifactionRepoImp.getNotifaction(
      page,
    );
    response.fold((l) {
      emit(NotificationError(l.toString()));
    }, (r) {
      nots = r.data ?? [];
      notifactionModel = r;
      emit(NotificationSuccess(r));
    });
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat.yMMMMd('ar_SA');
    return formatter.format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

  Future<void> loadMoreData() async {
    try {
      emit(NotificationLoading());

      // Assume you have a service method to fetch data
      final response = await notifactionRepoImp.getNotifaction(page);

      response.fold((l) {
        emit(NotificationError(l.toString()));
      }, (r) {
        if (r.data?.isEmpty ?? true) {
          // If no newer data is available, reset to the beginning
          page = 1;
        } else {
          nots.addAll(r.data!);
          notifactionModel = r;
          emit(NotificationSuccess(
            r,
          ));
          page++;
        }
      });
    } catch (e) {
      emit(NotificationError('Failed to load data: $e'));
    }
  }

  Future<void> loadMoreArticels() async {
    try {
      emit(ArticlesLoadingState());

      // Assume you have a service method to fetch data
      final response = await notifactionRepoImp.getArticles(page);

      response.fold((l) {
        emit(ArticlesErrorState(l.toString()));
      }, (r) {
        if (r.data?.isEmpty ?? true) {
          // If no newer data is available, reset to the beginning
          page = 1;
        } else {
          articels.addAll(r.data!);
          emit(ArticlesSuccessState(
            r,
          ));
          page++;
        }
      });
    } catch (e) {
      emit(NotificationError('Failed to load data: $e'));
    }
  }

  getArticels() async {
    emit(ArticlesLoadingState());
    notifactionRepoImp.getArticles(page).then((value) {
      value.fold((l) {
        emit(ArticlesErrorState(l.toString()));
      }, (r) {
        articels = r.data ?? [];
        emit(ArticlesSuccessState(r));
      });
    });
  }
  getArticelsDetails() async{
    emit(GetArticlesDetailsLoadingState());
    var rusult = await notifactionRepoImp.getArticlesDetails(page,);
    rusult.fold((l) {
      emit(ArticesDetailsErrorState(l.toString()));
    }, (r) {
      articelsDetails = r.data ?? [];
      
      emit(ArticesDetailsSuccessState(r));
    });

  }
}
