import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jpec_sama/main.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import '../controller/notification_controller.dart';

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

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );

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
      // schedule: NotificationAndroidCrontab.hourly(referenceDateTime: referenceDateTime)
    );
  }

  static Future<void> createReviewNotification() async {
    if (!(await AwesomeNotifications().isNotificationAllowed())) {
      return;
    }
    final nextDateEntries = await supabase
        .from('flashcard')
        .select('id,next_available_at')
        .gt('next_available_at', DateTime.now())
        .limit(1);
    int count = 0;

    DateTime? nextDate =
        DateTime.tryParse(nextDateEntries[0]['next_available_at']);
    if (nextDate == null) {
      return;
    }
    count = await supabase
        .from('flashcard')
        .count()
        .eq('nextDate', nextDateEntries[0]['next_available_at']);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 57,
        category: NotificationCategory.Reminder,
        channelKey: 'main',
        title: "Jpec-Sama Review",
        body: "You've got work to do ($count reviews)",
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
      schedule: NotificationCalendar.fromDate(
        date: nextDate,
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
