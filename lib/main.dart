import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:workmanager/workmanager.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'services/notification_service.dart';

const withSentry = true;

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initNotifications();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Supabase.initialize(
    url: 'https://tutsgtrbfpdvsxzyoqkk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1dHNndHJiZnBkdnN4enlvcWtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzA3OTksImV4cCI6MjAzNzI0Njc5OX0.tKn31L4GMM_x9qVGPCM-6KmAUmSdwyv9qFJF0vUnRSA',
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
  // Workmanager().cancelAll();
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  // Workmanager().registerPeriodicTask(
  //   "checkReviewsTask",
  //   "checkReviewsTask",
  //   frequency: const Duration(days: 1),
  // );
  //
}

Future<void> main() async {
  await initApp();
  runApp(const MyApp());
}
