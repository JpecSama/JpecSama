import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static Function(ReceivedNotification)? onNotificationTapped;

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    debugPrint("[NOTIFICATIONS] Yeah, new notif bb");
    // AppRouter router = AppRouter.;
    // router.router.routerDelegate.navigatorKey.currentState.pushNamed(routeName)
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    debugPrint("[NOTIFICATIONS] Show me the notif");
    // BuildContext? context = App.navigatorKey.currentState?.context;
    // if (context != null) {
    //   SnackBar snackBar = const SnackBar(
    //     content: Text('coucou bg'),
    //     duration: Duration(seconds: 5),
    //     backgroundColor: Colors.green,
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    debugPrint("[NOTIFICATIONS] Dismiss");
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    //Using Home handler with firebase
    // print(receivedAction.toString());

    // if (receivedAction.payload?.isNotEmpty ?? false) {
    //   Map<String, String?> payload = receivedAction.payload!;

    //   print("Not empty payload");
    //   print(payload.toString());

    //   if (payload.containsKey('routeName') && payload['routeName'] != null) {
    //     print('Redirecting');

    //     Map<String, String> pathParams = {};
    //     payload.forEach((key, value) {
    //       pathParams[key] = value.toString();
    //     });
    //     App.navigatorKey.currentState?.context
    //         .pushNamed(payload['routeName']!, pathParameters: pathParams);
    //   }
    // }
  }
}