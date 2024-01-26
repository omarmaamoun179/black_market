import 'dart:async';
import 'dart:math';
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
  static Timer? timer;
  static Future<void> initilaizseService() async {
    print('onStart0');
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        autoStartOnBoot: true,
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
    print('onStart2');
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
    // service.on('stopService').listen((event) {
    //   timer?.cancel();
    //   service.stopSelf();
    // });
    DioHelper.initDio();
    final notificationCubit = NotificationCubit(
      NotifactionRepoImp(),
    );
    await notificationCubit.getNotifaction();
    // Fetch notification data

    timer = Timer.periodic(
        const Duration(
          seconds: 10,
        ), (timer) async {
      await notificationCubit.getNotifaction();
      if (service is AndroidServiceInstance) {
        service.isForegroundService();

        // Use the notification data from the Cubit
        final notifactionModel = notificationCubit.notifactionModel;
        if (notifactionModel != null &&
            notifactionModel.data?.isNotEmpty == true) {
          NotificationService.showNotification(
              title: notifactionModel.data != null &&
                      notifactionModel.data!.isNotEmpty
                  ? notifactionModel
                          .data![
                              Random().nextInt(notifactionModel.data!.length)]
                          .title ??
                      ''
                  : '',
              body: notifactionModel.data?.first.body ?? '');
        }
      }

      service.invoke(
        'getNotifaction',
        {
          'title': notifactionModel.data?.first.title ?? '',
          'body': notifactionModel.data?.first.body ?? '',
        },
      );
    });
  }
}
