import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/notiffications/notifications_cubit.dart';
import 'package:warehouse/views/pages/notifications_view.dart';

class FirebaseApi {
  // final _androidChannel = const AndroidNotificationChannel(
  //   'high_importance_channel',
  //   'High Importance Notifications',
  //   description: 'this channel is used for important notifications',
  //   importance: Importance.defaultImportance,
  // );
  static Timer? timer;
  static final _notification = FlutterLocalNotificationsPlugin();

  static initNOti() async {
    await _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (details) {
        navigateTo(toPage: const NotificationsView());
      },
    );
  }

  static Future<void> createNotification(
      {required RemoteMessage message}) async {
    final notification = message.notification;
    final id = notification.hashCode;

    try {
      var iosDetails = const DarwinNotificationDetails();

      var androidDetails = const AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.defaultImportance, // or max
        priority: Priority.defaultPriority,
      );
      var notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );
      await _notification.show(
        id,
        notification!.title,
        notification.body,
        notificationDetails,
        payload: jsonEncode(message.toMap()),
      );

      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          if (KiwiContainer().resolve<NotificationsCubit>().isOpen == true) {
            await _notification.cancelAll();
            timer.cancel();
          }
        },
      );
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future initLocal() async {}
}
