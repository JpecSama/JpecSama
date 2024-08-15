import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'services/notification_service.dart';

const withSentry = true;

const supabaseUrl = 'https://tutsgtrbfpdvsxzyoqkk.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1dHNndHJiZnBkdnN4enlvcWtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzA3OTksImV4cCI6MjAzNzI0Njc5OX0.tKn31L4GMM_x9qVGPCM-6KmAUmSdwyv9qFJF0vUnRSA';

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
      final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
      final response = await supabaseClient
          .from('flashcard')
          .select('*,flashcard_answer(*)')
          .lte('next_available_at', DateTime.now())
          .count();

      int count = response.count;
      print('count $count');

      final hiveBox = await Hive.openBox('supabase');

      String? userId =
          hiveBox.get('userId') ?? supabaseClient.auth.currentUser?.id;
      print('userId $userId');

      if (count > 0) {
        // Send a notification
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        await messaging.subscribeToTopic("review_notification");

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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initNotifications();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: kDebugMode,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if (withSentry) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://742f313d00b9883088ceedeaa78849a5@o4505446900367360.ingest.us.sentry.io/4507708580298752';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(const MyApp()),
    );
  }
  //
  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  Workmanager().registerPeriodicTask(
    "checkReviewsTask",
    "checkReviewsTask",
    frequency: const Duration(hours: 1),
  );
  //

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
