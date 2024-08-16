import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jpec_sama/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:workmanager/workmanager.dart';

import '../services/notification_service.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      print('callbackDispatcher');
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getApplicationDocumentsDirectory(),
      );
      await Hive.initFlutter();

      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseKey,
        debug: kDebugMode,
      );
      final hiveBox = await Hive.openBox('supabase');

      String? userId = hiveBox.get('userId') ?? supabase.auth.currentUser?.id;
      print('userId $userId');
      if (userId == null) {
        return Future.value(true);
      }

      final response = await supabase
          .from('flashcard')
          .select('*')
          .lte(
            'next_available_at',
            DateTime.now(),
          )
          .eq('user_id', userId)
          .limit(100)
          .count();

      int count = response.count;

      if (count > 0) {
        await NotificationService.initNotifications();

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
        );
      }
    } catch (e) {
      print(e);
    }

    return Future.value(true);
  });
}
