import 'package:black_market/features/notification/presentation/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  List<String> tabs = ['الإشعارات', 'المقالات'];
  int currentIndex = 0;
  changeTab(int index) {
    currentIndex = index;

    emit(NotificationChangeTab());
  }
}
