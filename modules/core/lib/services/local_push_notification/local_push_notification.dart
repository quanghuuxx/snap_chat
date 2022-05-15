//* Sunday, 15th May 2022 10:32 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as timezone;

class LocalPushNotificatonService {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool? _didInit;

  LocalPushNotificatonService._internal();

  static final LocalPushNotificatonService _instance =
      LocalPushNotificatonService._internal();

  factory LocalPushNotificatonService() {
    return _instance;
  }

  final StreamController<ReceivedNotification> didReceiveLocalNotificationIOS =
      StreamController.broadcast();
  final StreamController<String?> didTapNotification =
      StreamController.broadcast();

  FutureOr<bool?> _init() async {
    if (_didInit == true) return true;
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {
        didReceiveLocalNotificationIOS.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      },
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _didInit = await _localNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) => didTapNotification.add(payload),
    );
    return _didInit;
  }

  void show(
    int id,
    String title,
    String body,
    String? payload,
  ) async {
    if (await _init() == false) return;

    _localNotificationsPlugin.show(
      id,
      title,
      body,
      _getNotificationDetails(),
      payload: payload,
    );
  }

  void schedule(
    int id,
    String title,
    String body, {
    required timezone.TZDateTime dateTime,
    String? payload,
    DateTimeComponents dateTimeComponents = DateTimeComponents.time,
  }) async {
    if (await _init() == false) return;

    _localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      dateTime,
      _getNotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: false,
      matchDateTimeComponents: dateTimeComponents,
    );
  }

  Future<void> didNotificationLaunchApp() async {
    final notificationAppLaunchDetails =
        await _localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp == true) {
      didTapNotification.add(notificationAppLaunchDetails?.payload);
    }
  }

  Future<void> configureLocalTimeZone() async {
    timezone.setLocalLocation(timezone.getLocation('Vietnam/Hanoi'));
  }

  NotificationDetails _getNotificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'chanel_id',
        'chanel_name',
        channelDescription: 'channel_description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
