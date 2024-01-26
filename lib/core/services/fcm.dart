import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:black_market/core/services/awesome_notication.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/datum.dart';
import 'package:black_market/features/notification/data/models/notifaction_model/notifaction_model.dart';
import 'package:black_market/features/notification/data/repositories/nots_imp_repo.dart';
import 'package:black_market/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCM {
  static Future<void> requestNotificationPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    print('Handling a background message ${message.messageId}');
    // await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
    await NotificationService.showNotification(
        title: NotifactionModel().data?.first.title ?? 'omar',
        body:NotifactionModel().data?.first.body ?? 'omar',);

    print(message.notification?.title ?? '');
  }

  static  setupForegroundFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        // Create a NotificationModel from the message
        NotifactionModel notifactionModel = NotifactionModel(
          data: [
            DatumNots(
              title: message.notification?.title ?? '',
              body: message.notification?.body ?? '',
            )
          ],
        );

        // Get the NotificationCubit from the context
        NotificationCubit notificationCubit =
NotificationCubit(NotifactionRepoImp());
        // Send the notification
        notificationCubit.getNotifaction();
      }
    });
  }

  //   static void setupForegroundFCM() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     // Handle the message
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');

  //     if (message.notification != null) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   });
  // }
}
