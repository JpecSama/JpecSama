import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static ReceivedAction? initialAction;

  static Future<void> initNotifications() async {
    tz.initializeTimeZones();

    AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      // 'resource://drawable/res_app_icon',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'main',
          channelName: 'Main channel',
          enableLights: true,
          enableVibration: true,
          playSound: true,
          channelShowBadge: true,
          channelDescription: 'Notification channel for main events',
          // defaultColor: const Color.fromARGB(255, 37, 122, 115),
          // ledColor: const Color.fromARGB(255, 37, 122, 115),
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: kDebugMode,
    );
    // AwesomeNotifications().setListeners(
    //     onActionReceivedMethod: (receivedAction) async {
    //   print('-------------------------------------');
    //   print('onActionReceivedMethod');
    //   var payload = receivedAction.payload;

    //   print(payload.toString());
    //   if (receivedAction.channelKey == 'normal_channel') {
    //     //do something here
    //   }
    // });

    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  static Future<void> createReviewScheduleNotification() async {
    if (!(await AwesomeNotifications().isNotificationAllowed())) {
      return;
    }
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 57,
        category: NotificationCategory.Reminder,
        channelKey: 'main',
        title: "Jpec-Sama Review",
        body: "You've got work to do",
        largeIcon: 'asset://assets/logo.png',
        bigPicture: 'asset://assets/logo.png',
        notificationLayout: Platform.isAndroid
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigPicture,
        wakeUpScreen: true,
        displayOnForeground: true,
        displayOnBackground: true,
        locked: false,
      ),
    );
  }

  static Future<void> createReviewNotification() async {
    if (!(await AwesomeNotifications().isNotificationAllowed())) {
      return;
    }
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 57,
        category: NotificationCategory.Reminder,
        channelKey: 'main',
        title: "Jpec-Sama Review",
        body: "You've got work to do",
        largeIcon: 'asset://assets/logo.png',
        bigPicture: 'asset://assets/logo.png',
        notificationLayout: Platform.isAndroid
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigPicture,
        wakeUpScreen: true,
        displayOnForeground: true,
        displayOnBackground: true,
        locked: false,
      ),
    );
  }

  static void askForNotificationPermissions(BuildContext context,
      {bool shouldForce = false}) async {
    Box userBox = await Hive.openBox('user');
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed &&
            (!userBox.containsKey('allow_notifications') || shouldForce)) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ).then((value) async {
            await userBox.put('allow_notifications', isAllowed);
          });
        }
      },
    );
  }
}
