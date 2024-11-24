// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpec_sama/services/notification_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'controller/notification_controller.dart';
import 'theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
import 'theme/custom_theme.dart';
/*
Thème: Langue Maternelle => Langue étrangère 
Version: Langue étrangère => Langue Maternelle
*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<void> _setFcmToken(String fcmToken) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId != null) {
    await supabase
        .from('profiles')
        .upsert({'id': userId, 'fcm_token': fcmToken});
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Future<void> _handleFirebaseCloudmessagingTokens() async {
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      // APNS token is available, make FCM plugin API requests...
      print("APNS OK");
    } else {
      //TODO NOT WORKING FOR IOS
      print("APN NOK");
    }
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("fcmToken $fcmToken");
    if (fcmToken != null) {
      _setFcmToken(fcmToken);
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
      await _setFcmToken(fcmToken);
    });
  }

  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((event) async {
      switch (event.event) {
        case AuthChangeEvent.signedIn:
          _handleFirebaseCloudmessagingTokens();
          break;
        default:
          print(event.event);
      }
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) async {});

    // AwesomeNotifications().setListeners(
    //   onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    //   onNotificationCreatedMethod:
    //       NotificationController.onNotificationCreatedMethod,
    //   onNotificationDisplayedMethod:
    //       NotificationController.onNotificationDisplayedMethod,
    //   onDismissActionReceivedMethod:
    //       NotificationController.onDismissActionReceivedMethod,
    // );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        //FOREGROUND
        // AwesomeNotifications().resetGlobalBadge();
        // AwesomeNotifications()
        //     .dismiss(57);
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomNavBarBloc>(
          create: (context) => CustomNavBarBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'JpecSama',
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // theme: themeData,
        theme: japaneseTheme,
        routerConfig: router,
      ),
    );
  }
}
