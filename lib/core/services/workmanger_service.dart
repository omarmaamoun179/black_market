import 'dart:async';

import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/services/awesome_notication.dart';
import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:workmanager/workmanager.dart';

class WorkMangerService {
 static Timer? timer;
static callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      print('onStart0');
      DioHelper.initDio();
      final notificationCubit = NotificationCubit(
        NotifactionRepoImp(),
      );
      await notificationCubit.getNotifaction();
      // Fetch notification data
      
      timer = Timer.periodic(const Duration(
        seconds: 10,
      ), (timer) async {
        await notificationCubit.getNotifaction();
        
      
          // Use the notification data from the Cubit
          final notifactionModel = notificationCubit.notifactionModel;
          if (notifactionModel != null &&
              notifactionModel.data?.isNotEmpty == true) {
            NotificationService.showNotification(
              title: notifactionModel.data![0].title!,
              body: notifactionModel.data![0].body!,
            
            );
          
        }
      });
      return Future.value(true);
    });
    

  }
  static Future<void> initilaizseService() async {
    print('onStart0');
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  
    await Workmanager().registerPeriodicTask(

      '1',
      'simplePeriodicTask',
      frequency: const Duration(
      seconds: 10,
      ),
    );
    print('onStart2');
  }
}
