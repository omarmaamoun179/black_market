import 'dart:async';
import 'dart:ui';

import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/core/services/awesome_notication.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';
import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

class BackGroundService {
  static NotifactionModel notifactionModel = NotifactionModel();
  static Future<void> initilaizseService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
      ),
    );
    service.startService();
  }

  static onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });
      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
    DioHelper.initDio();
    final notificationCubit = NotificationCubit(
      NotifactionRepoImp(),
    );
    await notificationCubit.getNotifaction();
    // Fetch notification data

    Timer.periodic(const Duration(minutes: 20), (timer) async {
      if (service is AndroidServiceInstance) {
        // Use the notification data from the Cubit
        final notifactionModel = notificationCubit.notifactionModel;
        if (notifactionModel != null &&
            notifactionModel.data?.isNotEmpty == true) {
          NotificationService.showNotification(
              title: notifactionModel.data?.first.title ?? '',
              body: notifactionModel.data?.first.body ?? '');
        }
      }

      // service.invoke(
      //   'update',
      //   {
      //     "current_date": DateTime.now().toIso8601String(),
      //   },
      // );
    });
  }
}
